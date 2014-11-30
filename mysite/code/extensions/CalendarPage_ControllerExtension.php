<?php

class CalendarPage_ControllerExtension extends Extension {

	private static $allowed_actions = array(
		'myevents'
	);

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

}
