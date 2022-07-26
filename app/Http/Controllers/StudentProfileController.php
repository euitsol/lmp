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
use App\Models\EduLevel;
use App\Models\EnglishTest;

use Illuminate\Support\Facades\Response;

class StudentProfileController extends VoyagerController\VoyagerBaseController
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function profile(){
        $data = [];
        $data['menu'] = Voyager::model('MenuItem')->findOrFail(15);
        $data['info'] = User::where('id', Auth::user()->id)->with(['country_details', 'city_details'])->get()->first();
        $data['details'] = StudentDetail::where('student_id', Auth::user()->id)->with(['awarding_country_details', 'edu_level_details', 'eng_test_details'])->get()->first();

        // dd($data);
        return view('student.profile.index', compact('data'));
    }

    public function profile_update(Request $request){

        $id = Auth::user()->id;
        $save = StudentDetail::where('student_id', $id)->first();
        if(empty($save)){
            abort(404);
        }else{
            $save->f_name = $request->fname;
            $save->m_name = $request->mname;
            $save->s_name = $request->lname;
            $save->title  = $request->title;
            $save->gender = $request->gender;
            $save->birth_country = $request->birth_country;
            $save->postcode = $request->post_code;
            $save->age = $request->age;
            $save->e_contact = $request->e_contact;
            $save->e_country_code = $request->e_country_code;
            $save->address = $request->address;
            $save->save();
        }

        return redirect()->back()->with([
            'message'    => 'Profile updated successfully',
            'alert-type' => 'success',
        ]);

    }
    public function levels(Request $request){

        $search = $request->search;

        if($search == ''){
           $levels = EduLevel::where('status','Active')->orderby('table_order','asc')->select('id','name', 'table_order')->limit(5)->get();
        }else{
           $levels = EduLevel::where('status','Active')->orderby('table_order','asc')->select('id','name', 'table_order')->where('name', 'like', '%' .$search . '%')->limit(5)->get();
        }

        return Response::json($levels);
    }
    public function eng_tests(Request $request){

        $search = $request->search;

        if($search == ''){
           $tests = EnglishTest::where('status','Active')->orderby('table_order','asc')->select('id','name', 'table_order')->limit(5)->get();
        }else{
           $tests = EnglishTest::where('status','Active')->orderby('table_order','asc')->select('id','name', 'table_order')->where('name', 'like', '%' .$search . '%')->limit(5)->get();
        }

        return Response::json($tests);
    }
    public function edu_update(Request $request){
        // return $request;
        $id = Auth::user()->id;
        $save = StudentDetail::where('student_id', $id)->first();
        if(empty($save)){
            abort(404);
        }else{
            $save->edu_level                        = $request->edu_level;
            $save->edu_degree                       = $request->edu_degree;
            $save->edu_awarding_body                = $request->edu_awarding_body;
            $save->edu_awarding_country             = $request->edu_awarding_country;
            $save->edu_qualification_result         = $request->edu_qualification_result;
            $save->edu_qualification_result_outof   = $request->edu_qualification_result_outof;
            $save->edu_qualification_date           = date('y-m-d', strtotime($request->edu_qualification_date));
            $save->edu_eng_writting_result          = $request->edu_eng_writting_result;
            $save->edu_eng_test                     = $request->edu_eng_test;
            $save->edu_eng_listening_result         = $request->edu_eng_listening_result;
            $save->edu_eng_reading_result           = $request->edu_eng_reading_result;
            $save->edu_eng_spoken_result            = $request->edu_eng_spoken_result;
            $save->edu_eng_other_result             = $request->edu_eng_other_result;
            $save->edu_eng_exam_date                = date('y-m-d', strtotime($request->edu_eng_exam_date));
            $save->save();
        }

        return redirect()->back()->with([
            'message'    => 'Education details updated successfully',
            'alert-type' => 'success',
        ]);
    }

}
