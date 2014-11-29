<?php
/**
 * Action links display on the home page
 */
class ActionLink extends DataObject {

    private static $db = array(
        'Title' => 'Varchar(255)',
        'Icon' => "VarChar(100)",
        'Content' => 'Text',
        'SortField' => 'Int'
    );

    private static $has_one = array(
        'Page' => 'SiteTree',
        'Link' => 'Page'
    );

    public function getCMSFields() {
        $fields = new FieldList();

        // Main
        $fields->push(new TextField('Title', 'Title'));
        $fields->push(new TextareaField('Content', 'Content'));
        $fields->push(new TreeDropdownField("LinkID", "Choose a page to link to:", "Page"));

        // Icons
        // $icons = singleton('ActionLink')->dbObject('Icon')->enumValues();
        // $iconArray = array();
        // foreach($icons as $icon) {
        //     $iconArray[$icon] = "<span class='icons--xl'><i class='i i-section-" . $icon . "'></i></span>";
        // }

        return $fields;
    }

    public function onBeforeWrite() {
        // add auto sort
        if (!$this->SortField) {
            $this->SortField = ActionLink::get()->max('SortField') + 1;
        }
        parent::onBeforeWrite();
    }

}