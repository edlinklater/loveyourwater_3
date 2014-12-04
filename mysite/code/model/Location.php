<?php

class Location extends DataObject {

    private static $db = array(
        'Latitude' => 'Decimal',
        'Longitude' => 'Decimal',
        'Zoom' => 'Int'
    );
    private static $has_one = array(
    );

}
