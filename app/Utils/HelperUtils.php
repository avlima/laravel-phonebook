<?php

namespace App\Utils;


use Illuminate\Http\Request;

class HelperUtils
{
    /**
     * @param Request $request
     * @return bool
     */
    public static function requestApi(Request $request)
    {
        if (preg_match('/\/api\//', $request->getRequestUri())) {
            return true;
        }

        return false;
    }

}