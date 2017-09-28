<?php

class LearnPage extends Page
{

    private static $description = 'A respository for learning resources.';

    private static $db = array(
        'SlideEmbedCode' => 'Text'
    );

    private static $has_many = array(
        'Documents' => 'LearnDocument.Link',
        'Videos' => 'LearnVideo.Link',
    );

    public function getCMSFields()
    {

        // Get the fields from the parent implementation
        $fields = parent::getCMSFields();

        $uploadField = new UploadField('Documents', 'Please upload your files.');

        $fields->addFieldToTab('Root.Documents', $uploadField);

        $documentConfig = GridFieldConfig_RecordEditor::create()
            ->addComponent(new GridFieldOrderableRows('SortField'));
        $documentConfig->getComponentByType('GridFieldDataColumns')->setDisplayFields(array(
            'Attachment.LinkURL' => 'Filename / URL'
        ));
        $fields->addFieldToTab("Root.Documents",
            GridField::create('Documents', 'Documents', $this->Documents())
                ->setConfig($documentConfig)
        );

        $videoConfig = GridFieldConfig_RecordEditor::create()
            ->addComponent(new GridFieldOrderableRows('SortField'));
        $videoConfig->getComponentByType('GridFieldDataColumns')->setDisplayFields([
            'Title' => 'Title',
            'VideoID' => 'YouTube Video',
        ]);
        $fields->addFieldToTab("Root.Videos",
            GridField::create('Videos', 'Videos', $this->Videos())
                ->setConfig($videoConfig)
        );

        $fields->addFieldToTab("Root.Main",
            TextareaField::create('SlideEmbedCode', 'Slide embed code'),
            'Content'
        );

        return $fields;
    }

}

class LearnPage_Controller extends Page_Controller
{

    public function init()
    {
        parent::init();
        Requirements::javascript('themes/loveyourwater/js/page-learn.js');
    }
}



