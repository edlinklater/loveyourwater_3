<?php

class EventCreatePage extends Page {

    /**
     * @throws Exception
     * @throws ValidationException
     * @throws null
     */
    public function onAfterWrite() {
        parent::onAfterWrite();

        if($this->CanViewType != "OnlyTheseUsers") {
            $this->CanViewType = "OnlyTheseUsers";
            $this->write();
        }

        $code = RegistrationPage::config()->user_group;
        $userGroup = Group::get()->filter("Code", $code)->first();
        if(!$userGroup) {
            $userGroup = new Group();
            $userGroup->Code = $code;
            $userGroup->Title = $code;
            $userGroup->Write();
        }
        $this->ViewerGroups()->add($userGroup);
    }

}

class EventCreatePage_Controller extends Page_Controller {

    /**
     * @var array
     */
    private static $allowed_actions = array(
        'CreateEvent',
        'edit'
    );

    /**
     *
     */
    public function init() {
        parent::init();
        if (!Member::currentUser()->ID) {
            Security::permissionFailure($this, "You must be logged in to create an event.");
        }
    }

    /**
     * @return static
     */
    public function CreateEvent() {
//		$EventID = Convert::raw2sql($this->urlParams['ID']);

        $fields = new FieldList(
            TextField::create('Title', 'Title', '', 50)
                ->setAttribute('placeholder','Enter a title')
                ->setAttribute('required', true)
                ->addExtraClass('form-control'),
            $startDateTime = DatetimeField::create("StartDateTime", 'Start'),
            $endDateTime = DatetimeField::create("EndDateTime", 'End'),

            DropdownField::create('Calendar', 'Category', Calendar::get()->map()),
            DropdownField::create('Region', 'Region', EventExtension::getRegions()),
            HtmlEditorField::create('Details', 'Description')
        );

        $startDateTime->getDateField()
            ->setConfig('showcalendar', 1)
            ->setAttribute('placeholder','Enter start date')
            ->setAttribute('readonly', 'true');

        $startDateTime->getTimeField()
            ->setConfig('timeformat', 'HH:mm')
            ->setAttribute('placeholder','Enter start time');

        $endDateTime->getDateField()
            ->setConfig('showcalendar', 1)
            ->setAttribute('placeholder','Enter end date')
            ->setAttribute('readonly', 'true');

        $endDateTime->getTimeField()
            ->setConfig('timeformat', 'HH:mm')
            ->setAttribute('placeholder','Enter end time');

        $actions = new FieldList(FormAction::create("doCreateEvent")
                ->setTitle("Create")
                ->addExtraClass('btn btn-success'));

        $requiredFields = new RequiredFields(array('Title', 'StartDateTime', 'EndDateTime'));

		$form = Form::create($this, 'CreateEvent', $fields, $actions, $requiredFields);
		$form->setTemplate('EventCreateForm');

		// if(is_numeric($eventID) && $eventID > 0) {
		// 	$event = Event::get()->byID($eventID);
		// 	if($event->exists() && $event->CreatorID == Member::currentUserID()) {
		// 		$form->loadDataFrom($event);
		// 	}
		// }

        return $form;
    }

    /**
     * @param $data
     * @param $form
     * @return bool|SS_HTTPResponse
     * @throws ValidationException
     * @throws null
     */
    public function doCreateEvent($data, $form) {

        // get the start datetime
        $formStartTime = $data['StartDateTime'];

        // get the end datetime
        $formEndTime = $data['EndDateTime'];

        // if start datetime and end datetime is set
        if(isset($formStartTime) && is_array($formStartTime)
            && isset($formEndTime) && is_array($formEndTime)) {

            // convert the datetime arrays into single strings
            $startstr = $formStartTime['date'] . ' ' . $formStartTime['time'];
            $endstr = $formEndTime['date'] . ' ' . $formEndTime['time'];

            // validate the start time is less than the end time
            if(strtotime($startstr) > strtotime($endstr)) {
                $form->sessionMessage('Please review your dates! The end date must be after the start date.', 'bad');
                return $this->redirectBack();
            }
        }

        $submission = new PublicEvent();
        $form->saveInto($submission);
        $submission->CreatorID = Member::currentUser()->ID;
        $submission->write();
        $calPage = CalendarPage::get()->first();
        if ($calPage) {
            return $this->redirect($this->join_links($calPage->Link(), "detail", $submission->ID));
        } else {
            return $this->redirectBack();
        }

    }

}
