<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

use App\Models\Country;
use App\Models\City;
use App\Models\Center;
use App\Models\User;
use App\Models\StudentDetail;

use Illuminate\Support\Facades\Response;

class StudentController extends VoyagerController\VoyagerBaseController
{
    //
    public function test(){

        return view('test');
    }

    public function register(){

        return view('student.auth.register');
    }

    public function countries(Request $request){

        $search = $request->search;

        if($search == ''){
           $countries = Country::where('status','Active')->orderby('name','asc')->select('id','name')->limit(5)->get();
        }else{
           $countries = Country::where('status','Active')->orderby('name','asc')->select('id','name')->where('name', 'like', '%' .$search . '%')->limit(5)->get();
        }

        return Response::json($countries);
    }

    public function cities(Request $request){

        $search = $request->search;
        $id = $request->id;

        if($search == ''){
           $cities = City::where('country_id', $id)->where('status','Active')->orderby('name','asc')->select('id','name')->limit(5)->get();
        }else{
           $cities = City::where('country_id', $id)->where('status','Active')->orderby('name','asc')->select('id','name')->where('name', 'like', '%' .$search . '%')->limit(5)->get();
        }

        return Response::json($cities);
    }

    public function reference(Request $request){

        $reference = $request->reference;
        if($reference != ''){
           $search = Center::where('reference', $reference)->where('status','Active')->get()->first();
        }

        if(!empty($search)){
            return Response::json($search->id);
        }else{
            return Response::json('');
        }
    }

    public function register_store(Request $request){
        $validated = $request->validate([
            'name'              => 'required|string|max:255',
            'email'             => 'required|email|unique:users,email|max:255',
            'tel'               => 'required|unique:users,tel',
            'country_code'      => 'required',
            'dob'               => 'required|date',
            'country'           => 'required|exists:countries,id',
            'city'              => 'required|exists:cities,id',
            'center_id'         => 'required|exists:centers,id',
            'password'          => 'required|min:6',
            'confirm_password'  => 'required|same:password'

        ]);

        $save = new User;
        $save->name = $request->name;
        $save->email = $request->email;
        $save->tel = $request->tel;
        $save->dob = $request->dob;
        $save->country_code = $request->country_code;
        $save->country_id = $request->country;
        $save->city_id = $request->city;
        $save->password = bcrypt($request->password);
        $save->role_id = 3;
        $save->save();

        //center data
        $center = new StudentDetail;
        $center->student_id = $save->id;
        $center->center_id = $request->center_id;
        $center->save();

        return redirect()->route('student.login')->with([
            'message'    => "Registration successfull, please log in to view info",
            'alert-type' => 'success',
        ]);

    }

    public function dashboard(){

        if(!auth()->user()){
            return redirect()->route('student.login');
        }

        return view('student.dashboard.dashboard');
    }

}
