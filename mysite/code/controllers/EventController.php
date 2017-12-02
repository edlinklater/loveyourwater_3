<?php

class EventController extends Controller
{
    private static $url_handlers = [
        '$ID/RegisterForm' => 'RegisterForm',
        '$ID/register' => 'register',
        '$ID' => 'index',
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
            return ['Content' => $event->Name];
        }
    }
}
