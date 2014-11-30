<?php

class EventCreatePage extends Page {

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

    private static $allowed_actions = array(
        'CreateEvent'
    );

    public function init() {
        parent::init();
        if (!Member::currentUser()->ID) {
            Security::permissionFailure($this, "You must be logged in to create an event.");
        }
    }

	private static $url_handlers = array(
		'$ID' => 'index'
	);

    public function CreateEvent() {
		$EventID = $this->urlParams['ID'];

        $fields = new FieldList(
            TextField::create("Title")
                ->setAttribute('placeholder','Enter a title')
                ->setAttribute('required', true),
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

        $actions = new FieldList(FormAction::create("doCreateEvent")->setTitle("Create"));

        $requiredFields = new RequiredFields(array('Title', 'Start'));

		$form = Form::create($this, 'CreateEvent', $fields, $actions, $requiredFields);

		if(is_numeric($EventID) && $EventID > 0) {
			$Event = Event::get()->byID($EventID);
			if($Event->exists() && $Event->CreatorID == Member::currentUserID()) {
				die();
				$form->loadDataFrom($Event);
			}
		}

        return $form;
    }

    public function doCreateEvent($data, $form) {
        $submission = new Event();
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