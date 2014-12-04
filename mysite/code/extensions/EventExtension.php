<?php
/**
 * {@link Event} extension
 */
class EventExtension extends DataExtension {

	private static $db = array(
		"Region" => "Enum('Northland, Auckland, Waikato, Bay of Plenty, Gisborne, Hawkes Bay, Taranaki,
		 Manawatu-Whanganui, Wellington, Tasman, Nelson, Marlborough, West Coast, Canterbury, Otago, Southland')"
	);

	private static $has_one = array(
		"Creator" => "Member"
	);

	public function updateCMSFields(FieldList $fields) {
		$regionDropDown = new DropdownField('Region', 'Region', $this->owner->dbObject('Region')->enumValues());
		$fields->addFieldToTab('Root.Main', $regionDropDown);

		$memberLookup = new DropdownField('CreatorID', 'Creator', Member::get()->map('ID', 'Name'));
		$fields->addFieldToTab('Root.Main', $memberLookup);
	}

	public static function getRegions() {
		return singleton('Event')->dbObject('Region')->enumValues();
	}

}
