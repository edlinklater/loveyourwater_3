<?php

class CalendarPage_ControllerExtension extends Extension {

	private static $allowed_actions = array(
		'myevents'
	);

	public function myevents() {
		return $this->owner;
	}

	public function isMyEvents() {
		return $this->owner->request->allParams()['Action'] == 'myevents';
	}

}
