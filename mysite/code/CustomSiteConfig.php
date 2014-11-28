<?php
class CustomSiteConfig extends DataExtension {
    private static $db = array(
        'TermsAndConditions' => 'HTMLText'
    );
    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldToTab("Root.Main", new HTMLEditorField("TermsAndConditions", "Terms and Conditions"));
    }
}