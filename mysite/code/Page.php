<?php

class Page extends SiteTree {

    private static $db = array(
        "Subtitle" => "Varchar",
        "IsTerms" => "Boolean",
    );

    private static $has_many = array(
        'Banners' => 'Banner.Page'
    );

    public function getCMSFields() {
        // Get the fields from the parent implementation
        $fields = parent::getCMSFields();

        //google map module
        $subtitle = new TextField('Subtitle', 'Subtitle');
        $fields->addFieldToTab('Root.Main', $subtitle, 'Content');
        $fields->addFieldToTab('Root.Settings', new CheckboxField('IsTerms', 'T&Cs Page'));

        // Banners
        $fields->addFieldToTab('Root.Banners',
            new HeaderField('BannerHeader', 'The first 4 banners will be used', 6)
        );
        $bannerConfig = GridFieldConfig_RecordEditor::create()
            ->addComponent(new GridFieldOrderableRows('SortField')
        );
        $fields->addFieldToTab("Root.Banners",
            GridField::create('Banners', 'Banners', $this->Banners())
                ->setConfig($bannerConfig)
        );

        return $fields;
    }

}

class Page_Controller extends ContentController {

    private static $allowed_actions = array(
        'getTermsPageLink',
    );

    public function init() {
        parent::init();
    }

    public function getTermsPageLink() {
		$TermsPage = DataObject::get_one('Page', '"IsTerms" = TRUE');
		if($TermsPage instanceof DataObject) {
			return $TermsPage->Link();
		}
    }

    public function getLimitBanners() {
        return $this->Banners()->sort('SortField ASC')->limit(4);
    }

}
