<?php

class EventListPage extends Page
{
    // @todo: Hide unnecessary fields
}

class EventListPage_Controller extends Page_Controller
{
    public function getEventsForCurrentSite()
    {
        return Event::get()
            ->filter('StartTime:GreaterThan', 'NOW')
            ->filter('SubsiteID', Subsite::currentSubsiteID())
            ->sort('StartTime ASC');
    }

    public function getEventsForOtherSites()
    {
        return Event::get()
            ->filter('StartTime:GreaterThan', 'NOW')
            ->exclude('SubsiteID', Subsite::currentSubsiteID())
            ->sort('StartTime ASC');
    }
}
