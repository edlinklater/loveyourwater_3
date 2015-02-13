<?php
/**
 * A document attached to the Learn page.
 */
class LearnDocument extends DataObject {
    private static $db = array(
        'Title' => 'Varchar(255)',
        'Description' => 'Text',
        'Type' => "Enum(',PDF,Document,Presentation,Video')",
        'SortField' => 'Int'
    );

    private static $has_one = array(
        'File' => 'File',
        'Link' => 'LearnPage',
        'Preview' => 'Image'
    );

    private static $file_extensions = array(
        'PDF' => array('pdf'),
        'Presentation' => array('ppt', 'pps', 'pot', 'pptx',  'pptm', 'potx', 'potm', 'odp', 'otp'),
        'Video' => array('avi', 'mpeg', 'mpg', 'mov')
    );

    public function getCMSFields() {
        $fields = new FieldList();

        $fields->push(TextField::create('Title'));
        $fields->push(TextareaField::create('Description'));
        $fields->push(DropdownField::create('Type', 'Type', singleton('LearnDocument')->dbObject('Type')->enumValues())
            ->setDescription('Will be automatically detected on save.'));
        $fields->push(UploadField::create('File'));
        $fields->push(UploadField::create('Preview', 'Preview image'));

    	return $fields;
    }

    public function onBeforeWrite() {
        // Default the type baesd on the file extension (if it exists).
        if (!$this->Type && $this->File()) {
            $extension = strtolower($this->File()->getExtension());
            foreach (LearnDocument::$file_extensions as $type => $extensions) {
                if (in_array($extension, $extensions)) {
                    $this->Type = $type;
                    break;
                }
            }

            if (!$this->Type) {
                $this->Type = 'Document';
            }
        }

        // Set the auto-sort to be after all other existing documents.
        if (!$this->SortField) {
            $this->SortField = LearnDocument::get()->max('SortField') + 1;
        }

        parent::onBeforeWrite();
    }
}