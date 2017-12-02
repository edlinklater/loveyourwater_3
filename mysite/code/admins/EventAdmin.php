<?php

class EventAdmin extends ModelAdmin
{
    private static $managed_models = ['Event', 'Sponsor'];
    private static $url_segment = 'events';
    private static $menu_title = 'Events';

    public function getEditForm($id = null, $fields = null){
        $form = parent::getEditForm($id, $fields);

        $gridField = $form->Fields()->fieldByName($this->sanitiseClassName($this->modelClass));
        if(class_exists('Subsite')){
            $list = $gridField->getList()->filter(array('SubsiteID'=>Subsite::currentSubsiteID()));
            $gridField->setList($list);
        }

        return $form;
    }

    public function subsiteCMSShowInMenu(){
        return true;
    }
}
