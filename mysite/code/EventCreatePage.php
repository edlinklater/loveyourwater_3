<?php

class EventCreatePage extends Page {

}

class EventCreatePage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'Form'
    );

    public function Form() {
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

        return Form::create($this, 'Form', $fields, $actions, $requiredFields);
    }

    public function doCreateEvent($data, $form) {
        $submission = new Event();
        $form->saveInto($submission);
        $submission->write();
        $calPage = CalendarPage::get()->first();
        if ($calPage) {
            return $this->redirect($this->join_links($calPage->Link(), "detail", $submission->ID));            
        } else {
            return $this->redirectBack();
        }

    }

}