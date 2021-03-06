<?php

/**
 * Class HomePage
 */
class HomePage extends Page
{

    /**
     * @var array
     */
    private static $has_many = array(
        'ActionLinks' => 'ActionLink.Page'
    );

    /**
     * @return FieldList
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        // Action Links
        $fields->addFieldToTab('Root.CallToActions',
            new HeaderField('ActionLinksHeader', 'The first 4 action links will be used', 6)
        );
        $actionConfig = GridFieldConfig_RecordEditor::create()
            ->addComponent(new GridFieldOrderableRows('SortField')
            );
        $fields->addFieldToTab("Root.CallToActions",
            GridField::create('ActionLinks', 'ActionLinks', $this->ActionLinks())
                ->setConfig($actionConfig)
        );

        return $fields;
    }

}

class HomePage_Controller extends Page_Controller
{

    /**
     * action links sorted with a limit.
     *
     * @param  integer $limit define a limit on the returned action links
     * @return ArrayList          of ActionLinks
     */
    public function getLimitActionLinks($limit = 4)
    {
        return $this->ActionLinks()
            ->sort('SortField ASC')
            ->limit($limit);
    }

    /**
     * Return the default image from Siteconfig
     * @return mixed
     */
    public function getSiteDefaultEventImage()
    {
        return SiteConfig::current_site_config()->DefaultEventImage();

    }

}
