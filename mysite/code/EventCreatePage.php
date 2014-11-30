<?php

class EventCreatePage extends Page {

}

class EventCreatePage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'CreateEvent'
    );

    public function CreateEvent() {
        $fields = new FieldList(
            TextField::create("Title")
                ->setAttribute('placeholder','Enter a title')
                ->setAttribute('required', true)
                ->addExtraClass('form-control'),
            $startDateTime = DatetimeField::create("StartDateTime", 'Start'),
            $endDateTime = DatetimeField::create("EndDateTime", 'End'),
            DropdownField::create('Region', 'Region', EventExtension::getRegions())->addExtraClass('form-control'),
            HtmlEditorField::create('Details', 'Description')->addExtraClass('form-control')->setRows(10)
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

        $requiredFields = new RequiredFields(array('Title', 'Start'));

        $form = Form::create($this, 'CreateEvent', $fields, $actions, $requiredFields);
        $form->setTemplate('EventCreateForm');
        return $form;
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