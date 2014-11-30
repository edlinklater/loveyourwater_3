<?php

class HomePage extends Page {

	private static $has_many = array(
		'ActionLinks' => 'ActionLink.Page'
	);

	public function getCMSFields() {
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

class HomePage_Controller extends Page_Controller {

	public function getLimitActionLinks() {
        return $this->ActionLinks()->sort('SortField ASC')->limit(4);
    }

    /**
     * Get the next 4 upcoming events
     * @return Event
     */
    public function getEvents() {
        return CalendarHelper::all_events()->limit(4);
    }

}
