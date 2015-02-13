<?php

/**
 * Class MemberExtension
 *
 * Add love your water Member fields
 */
class MemberExtension extends DataExtension {

    /**
     * @var array
     */
    private static $db = array(
        'Phone' => 'VarChar(255)',
        'IsVerified' => 'Boolean',
        'PendingFormData' => 'Text',
        'VerificationCode' => 'Varchar(255)',
        'VerificationExpiry' => 'Datetime'
    );

}