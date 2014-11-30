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

    public function CreateEvent() {
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

        return Form::create($this, 'CreateEvent', $fields, $actions, $requiredFields);
    }

    public function doCreateEvent($data, $form) {
        $submission = new Event();
        $form->saveInto($submission);
        // if no currentUser, redirect back to form
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