<?php

class EventExtension extends DataExtension {

	private static $db = array(
		"Region" => "Enum('Northland, Auckland, Waikato, Bay of Plenty, Gisborne, Hawkes Bay, Taranaki,
		 Manawatu-Whanganui, Wellington, Tasman, Nelson, Marlborough, West Coast, Canterbury, Otago, Southland')"
	);

	public function updateCMSFields(FieldList $fields) {
		$regionDropDown = new DropdownField('Region', 'Region', $this->owner->dbObject('Region')->enumValues());
		$fields->addFieldToTab('Root.Main', $regionDropDown);
	}


}
