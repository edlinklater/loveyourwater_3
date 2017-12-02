<?php

class EventController extends Controller
{
    private static $url_handlers = [
        '$ID/RegisterForm' => 'RegisterForm',
        '$ID/register' => 'register',
        '$ID!/$Region/$Segment' => 'index',
    ];

    public function Link()
    {
        if (!empty($this->request->param('ID'))) {
            $event = Event::get()->filter('Code', $this->request->param('ID'));
            return $event->Link();
        } else {
            return 'event';
        }
    }

    public function index()
    {
        $event = Event::get()->filter('Code', $this->request->param('ID'))->first();
        if ($event->exists()) {
            return [
                'Title' => $event->Name,
                'Event' => $event
            ];
        }

        return new SS_HTTPResponse('', 404);
    }

    /**
     * Returns a fixed navigation menu of the given level. (Pulled from ContentController)
     * @param int $level Menu level to return.
     * @return ArrayList
     */
    public function getMenu($level = 1) {
        if ($level == 1) {
            $result = SiteTree::get()->filter(array(
                "ShowInMenus" => 1,
                "ParentID" => 0
            ));

        } else {
            $parent = $this->data();
            $stack = array($parent);

            if ($parent) {
                while ($parent = $parent->Parent) {
                    array_unshift($stack, $parent);
                }
            }

            if (isset($stack[$level-2])) $result = $stack[$level-2]->Children();
        }

        $visible = array();

        // Remove all entries the can not be viewed by the current user
        // We might need to create a show in menu permission
        if (isset($result)) {
            foreach ($result as $page) {
                if ($page->canView()) {
                    $visible[] = $page;
                }
            }
        }

        return new ArrayList($visible);
    }
}
