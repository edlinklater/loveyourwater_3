<?php
/**
 * Extends {@link CalendarPage_Controller} to allow additional filtering:
 * - myevents
 * - calendar
 */
class CalendarPage_ControllerExtension extends Extension {

	private static $allowed_actions = array(
		'myevents',
		'filtercalendar'
	);

	// my events filter
	public function myevents() {
		return $this->owner;
	}

	/**
	 * Get all events created by the current member.
	 */
	public function getMyEvents(){
		$events = CalendarHelper::all_events();
		return $events->filter('CreatorID', Member::CurrentUserID());
	}

	/**
	 * Check that myevents filter is active.
	 */
	public function isMyEvents() {
		$params = $this->owner->request->allParams();
		return ($params['Action'] == 'myevents' ? true : false);
	}

	// calendar filter
	public function filtercalendar() {
		return $this->owner;
	}

	/**
	 * Get all calendars
	 */
	public function getCalendarFilter() {
		return Calendar::get();
	}

	/**
	 * Get all events filtered by it's associated calendar.
	 */
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
