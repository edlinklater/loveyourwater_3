<?php

class Page extends SiteTree {

    private static $db = array(
        "Subtitle" => "Varchar",
        "IsTerms" => "Boolean",
        "Summary" => 'Text'
    );

    private static $has_many = array(
        'Banners' => 'Banner.Page'
    );

    public function getCMSFields() {
        // Get the fields from the parent implementation
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new TextareaField('Summary', 'Summary'), 'Content');

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
        'LoginForm'
    );

    public function init() {
        parent::init();

        // You can include any CSS or JS required by your project here.
        // See: http://doc.silverstripe.org/framework/en/reference/requirements

		Requirements::javascript('mysite/thirdparty/jquery/jquery-1.11.1.min.js');
		Requirements::javascript('mysite/thirdparty/jquery/jquery-migrate-1.2.1.js');

		Requirements::block('framework/thirdparty/jquery/jquery.js');
		Requirements::block('instagramfeed/javascript/jquery/jquery-1.11.1.min.js');
    }

    public function getRegistrationLink() {
        if($page = RegistrationPage::get()->first()) {
            return $page->Link();
        }
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
