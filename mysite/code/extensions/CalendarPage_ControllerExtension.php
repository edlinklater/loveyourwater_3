<?php

class CalendarPage_ControllerExtension extends Extension {

	private static $allowed_actions = array(
		'myevents',
		'filtercalendar'
	);

	// my events filter
	public function myevents() {
		return $this->owner;
	}

	public function getMyEvents(){
		$events = CalendarHelper::all_events();
		return $events->filter('CreatorID', Member::CurrentUserID());
	}

	public function isMyEvents() {
		return $this->owner->request->allParams()['Action'] == 'myevents';
	}

	// calendar filter
	public function getCalendarFilter() {
		return Calendar::get();
	}

	public function filtercalendar() {
		return $this->owner;
	}

	public function getFilteredEvents(){
		$filter = $this->owner->request->getVar('CalendarFilter');
		$calendar = Calendar::get()->byID($filter);

		if($calendar) {
			$events = CalendarHelper::all_events();
			return $events->filter('CalendarID', $calendar->ID);
		}
		return null;
	}

}
