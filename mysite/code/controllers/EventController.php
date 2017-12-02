<?php

class EventController extends Controller
{
    private static $url_handlers = [
        'CreateEventForm' => 'CreateEventForm',
        'create' => 'createevent',
        '$ID!/RegisterForm' => 'RegisterForm',
        '$ID!/register' => 'register',
        '$ID!/$Region/$Segment' => 'index',
    ];

    private static $allowed_actions = [
        'createevent', 'CreateEventForm'
    ];

    public function EditorToolbar() {
        return HtmlEditorField_Toolbar::create($this, 'EditorToolbar');
    }

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
            return ['Event' => $event];
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

    public function createevent()
    {
        return ['Form' => $this->CreateEventForm()];
    }

    public function CreateEventForm()
    {
//        $geoField = LeafletField::create('Geometry', 'Location', $this);
//        $geoField->setDrawOptions(['rectangle' => false, 'circle' => false]);
//        Requirements::customScript('window.leafletfieldInit()');

        $fields = FieldList::create(
            TextField::create('Name', 'Title', '', 200)
                ->setAttribute('required', true),
            DropdownField::create('Region', 'Region', (new Event)->obj('Region')->enumValues()),
            FieldGroup::create(
                HeaderField::create('DateHeader', 'Dates', 3),
                $startField = DateTimeField::create('StartTime', 'Start'),
                $endField = DateTimeField::create('EndTime', 'End')
            ),
            TextField::create('Summary'),
            TextareaField::create('Content', 'Description'),
            CheckboxField::create('Active', 'Publicly visible')
        );

        $startField->getDateField()
            ->setConfig('showcalendar', 1);
        $endField->getDateField()
            ->setConfig('showcalendar', 1);

        return Form::create(
            $this,
            'CreateEventForm',
            $fields,
            FieldList::create(FormAction::create('doCreateEvent')->setTitle('Create')),
            RequiredFields::create(['Title', 'Region', 'StartTime', 'EndTime'])
        );
    }

    public function doCreateEvent($data, Form $form)
    {
        $event = new Event();
        $form->saveInto($event);
        $event->CreatorID = Member::currentUserID();
        $event->write();

        return $this->redirect($event->Link());
    }
}
