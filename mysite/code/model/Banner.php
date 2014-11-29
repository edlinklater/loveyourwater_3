<?php
/**
 * Homepage call to action banner.
 */
class Banner extends DataObject {

    private static $db = array(
        'Title' => 'Text',
        'Content' => 'HTMLText',
        'ButtonText' => 'Text',
        'SortField' => 'Int'
    );

    private static $has_one = array(
    	'Image' => 'Image',
    	'Page' => 'SiteTree'
    );

    public function getCMSFields() {
    	$fields = new FieldList();

    	$fields->push(new TextField('Title', 'Title'));
    	$fields->push(new HTMLEditorField('Content', 'Content'));
    	$fields->push(new TextField('ButtonText', 'ButtonText'));
    	$fields->push(new TreeDropdownField("PageID", "Choose a page to link to:", "SiteTree"));
    	$fields->push(new UploadField('Image', 'Image'));

    	return $fields;
    }

    public function BannerPos($pos) {
        return $pos - 1;
    }

    public function onBeforeWrite() {
        // add auto sort
        if (!$this->SortField) {
            $this->SortField = Banner::get()->max('SortField') + 1;
        }
        parent::onBeforeWrite();
    }

}
