<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;

use App\Models\City;

class CityController extends VoyagerController\VoyagerBaseController
{
    //

    public function status($id){
        $save = City::where('id', $id)->first();
        $save->status = $save->status=="Active"?"Deactive":"Active";
        $save->save();

        return redirect(route('voyager.cities.index'))->with([
            'message'    => 'City status changed successfully',
            'alert-type' => 'success',
        ]);

    }

}

