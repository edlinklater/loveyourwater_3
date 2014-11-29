<?php

class MemberExtension extends DataExtension {

    private static $db = array(
        'Phone' => 'VarChar(255)',
        'IsVerified' => 'Boolean',
        'PendingFormData' => 'Text',
        'VerificationCode' => 'Varchar(255)',
        'VerificationExpiry' => 'Datetime'
    );

}