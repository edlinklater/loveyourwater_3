<?php
/**
 * Homepage call to action banner.
 */
class LearnDocument extends DataObject {

    private static $db = array(
         'SortField' => 'Int'
    );

    private static $has_one = array(
    	'File' => 'File',
        'Link' => 'LearnPage',
        'Preview' => 'Image'
    );

    public function getCMSFields() {
    	$fields = new FieldList();

    	$fields->push(UploadField::create('File', 'File'));
        $fields->push(UploadField::create('Preview', 'Preview image'));

    	return $fields;
    }

    public function onBeforeWrite() {
        // add auto sort
        if (!$this->SortField) {
            $this->SortField = LearnDocument::get()->max('SortField') + 1;
        }
        parent::onBeforeWrite();
    }

}
