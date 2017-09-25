<?php

class Page extends SiteTree
{

    /**
     * @var array
     */
    private static $db = array(
        "Subtitle" => "Varchar",
        "IsTerms" => "Boolean",
        "Summary" => 'Text'
    );

    /**
     * @var array
     */
    private static $has_many = array(
        'Banners' => 'Banner.Page'
    );

    /**
     * @return FieldList
     */
    public function getCMSFields()
    {
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

class Page_Controller extends ContentController
{

    /**
     * @var array
     */
    private static $allowed_actions = array(
        'getTermsPageLink',
        'LoginForm'
    );

    /**
     *
     */
    public function init()
    {
        parent::init();
        Requirements::javascript('mysite/thirdparty/jquery/jquery-1.11.1.min.js');
        Requirements::block('framework/thirdparty/jquery/jquery.js');
        Requirements::javascript(SSViewer::get_theme_folder() . '/js/bootstrap.min.js');
        Requirements::javascript('themes/loveyourwater/js/helper.js');
    }

    /**
     * Template helper function for Registration form
     * @return mixed
     */
    public function getRegistrationLink()
    {
        if ($page = RegistrationPage::get()->first()) {
            return $page->Link();
        }
    }

    /**
     * Template helper function for Terms and conditions pages
     * @return mixed
     */
    public function getTermsPageLink()
    {
        $TermsPage = DataObject::get_one('Page', '"IsTerms" = TRUE');
        if ($TermsPage instanceof DataObject) {
            return $TermsPage->Link();
        }
    }

    /**
     * Return the first 4 banners from the CMS
     * @return mixed
     */
    public function getLimitBanners()
    {
        return $this->Banners()->sort('SortField ASC')->limit(4);
    }

    public function ShowLoginBox()
    {
        $hasFailedLogin = Session::get('has_failed_login');
        Session::set('has_failed_login', false);
        return $hasFailedLogin;
    }
}
