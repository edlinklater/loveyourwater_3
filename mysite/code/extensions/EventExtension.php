<?php
/**
 * {@link Event} extension
 */
class EventExtension extends DataExtension {

	/**
	 * Regional data
	 * @var array
	 */
	private static $db = array(
		"Region" => "Enum('Northland, Auckland, Waikato, Bay of Plenty, Gisborne, Hawkes Bay, Taranaki,
		 Manawatu-Whanganui, Wellington, Tasman, Nelson, Marlborough, West Coast, Canterbury, Otago, Southland')",
		"Geometry" => "Text"
	);

	/**
	 * @var array
	 */
	private static $has_one = array(
		"Creator" => "Member"
	);

	/**
	 * @param FieldList $fields
	 */
	public function updateCMSFields(FieldList $fields) {
		$regionDropDown = new DropdownField('Region', 'Region', $this->owner->dbObject('Region')->enumValues());
		$fields->addFieldToTab('Root.Main', $regionDropDown);
		$memberLookup = new DropdownField('CreatorID', 'Creator', Member::get()->map('ID', 'Name'));
		$fields->addFieldToTab('Root.Main', $memberLookup);

		$geoField = new LeafletField('Geometry', 'Location', $this->owner);
		$geoField->setDrawOptions(array(
		    'rectangle' => false,
		    'circle'	=> false
		));
		$fields->addFieldToTab('Root.Location', $geoField);
	}

	/**
	 * Return regions availble for events
	 * @return mixed
	 */
	public static function getRegions() {
		return singleton('Event')->dbObject('Region')->enumValues();
	}

}
