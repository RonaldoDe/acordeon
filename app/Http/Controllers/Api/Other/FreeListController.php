<?php

namespace App\Http\Controllers\Api\Other;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\SongState;

class FreeListController extends Controller
{
    public function songState()
    {
        $state = SongState::get();

        return response()->json(['response' => $state], 200);
    }

}
