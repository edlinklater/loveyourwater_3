<?php
/**
 * Action links display on the home page
 */
class ActionLink extends DataObject {

    /**
     * @var array
     */
    private static $db = array(
        'Title' => 'Varchar(255)',
        'Icon' => "VarChar(100)",
        'Content' => 'Text',
        'SortField' => 'Int'
    );

    /**
     * @var array
     */
    private static $has_one = array(
        'Page' => 'SiteTree',
        'Link' => 'Page'
    );

    /**
     * @return FieldList
     */
    public function getCMSFields() {
        $fields = new FieldList();

        // Main
        $fields->push(new TextField('Title', 'Title'));
        $fields->push(new TextareaField('Content', 'Content'));
        $fields->push(new TreeDropdownField("LinkID", "Choose a page to link to:", "Page"));

        // Icons
        $fields->push(TextField::create('Icon', 'Icon')
            ->setDescription('Insert a glyphicon class from <a href="http://getbootstrap.com/components/#glyphicons" target="_blank">here</a> (eg. glyphicon-asterisk)'));

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