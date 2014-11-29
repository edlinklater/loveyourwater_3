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
                ->setAttribute('placeholder','Enter a title'),
            $startDateTime = DatetimeField::create("Start"),
            $endDateTime = DatetimeField::create("End"),
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

        $actions = new FieldList(FormAction::create("save")->setTitle("Create"));

        $requiredFields = new RequiredFields(array('Title', 'Start'));

        return Form::create($this, 'EventCreateForm', $fields, $actions, $requiredFields);
    }

}