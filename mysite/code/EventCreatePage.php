<?php

class EventCreatePage extends Page {

}

class EventCreatePage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'Form'
    );

    public function Form() {
        $dateTime = DatetimeField::create("Start");
        $dateTime->getDateField()->setConfig('showcalendar', 1);
        $fields = new FieldList(
            TextField::create("Title"),
            $dateTime,
            TextField::create("Duration"),
            DropdownField::create("Category")
        );
        $actions = new FieldList(FormAction::create("save")->setTitle("Save"));
        return Form::create($this, 'EventCreateForm', $fields, $actions);
    }

}