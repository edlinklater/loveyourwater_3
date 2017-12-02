<?php

class EventRegistration extends DataObject implements JsonSerializable
{

    private static $db = [
        'CheckedIn' => 'Boolean',
        'Comments' => 'Text',
    ];

    private static $has_one = [
        'Event' => 'Event',
        'Member' => 'Member',
    ];

    private static $summary_fields = [
        'Member.Name' => 'Member',
        'CheckedIn' => 'Here',
    ];

    private static $indexes = [
        'UniqueRegistration' => [
            'type' => 'unique',
            'value' => '"EventID","MemberID"',
        ],
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->changeFieldOrder(['EventID', 'MemberID', 'Comments', 'CheckedIn']);

        return $fields;
    }

    public function jsonSerialize()
    {
        $data = [
            'ID' => $this->ID,
            'Member' => [
                'ID' => $this->Member()->ID,
                'Name' => $this->Member()->Name,
            ],
            'CheckedIn' => $this->CheckedIn,
        ];

        return $data;
    }
}
