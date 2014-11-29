<?php
/**
 * Homepage call to action banner.
 */
class Banner extends DataObject {

    private static $db = array(
        'Title' => 'Text',
        'Content' => 'HTMLText',
        'ButtonText' => 'Text'
    );

    private static $has_one = array(
    	'Image' => 'Image',
    	'Link' => 'SiteTree'
    );

    public function getCMSFields() {
    	$fields = new FieldList();

    	$fields->push(new TextField('Title', 'Title'));
    	$fields->push(new HTMLEditorField('Content', 'Content'));
    	$fields->push(new TextField('ButtonText', 'ButtonText'));
    	$fields->push(new TreeDropdownField("LinkID", "Choose a page to link to:", "SiteTree"));
    	$fields->push(new UploadField('Image', 'Image'));

    	return $fields;
    }

}
