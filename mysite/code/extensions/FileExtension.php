<?php

/**
 * {@link File} extension
 */
class FileExtension extends DataExtension
{

    private static $has_one = array(
        "LearnPage" => "LearnPage"
    );
}
