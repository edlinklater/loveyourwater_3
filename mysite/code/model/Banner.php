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
    	'Page' => 'SiteTree',
        'Link' => 'Page'
    );

    public function getCMSFields() {
    	$fields = new FieldList();

    	$fields->push(new TextField('Title', 'Title'));
    	$fields->push(HTMLEditorField::create('Content', 'Content')
            ->setRows(10)
            ->setDescription('First 50 words.'));
    	$fields->push(new TextField('ButtonText', 'ButtonText'));
    	$fields->push(new TreeDropdownField("LinkID", "Choose a page to link to:", "Page"));
    	$fields->push(UploadField::create('Image', 'Image')
            ->setDescription('1280x400px best dimensions.'));

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
