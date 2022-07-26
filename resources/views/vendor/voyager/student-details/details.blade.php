@extends('voyager::master')

@section('page_title', 'Student Details')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class=""></i> Student Details
    </h1>

    @include('voyager::multilingual.language-selector')

@stop

@section('content')
<?php
if (\Illuminate\Support\Str::startsWith(Auth::user()->avatar, 'http://') || \Illuminate\Support\Str::startsWith(Auth::user()->avatar, 'https://')) {
    $user_avatar = Auth::user()->avatar;
} else {
    $user_avatar = Voyager::image(Auth::user()->avatar);
}
?>
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-header"></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-2 panel pt-2 pb-2">
                                <ul class="nav nav-tabs card-header-tabs bg-white" id="student-details-tabs" role="tablist" style="background: transparent;">
                                    <li class="w-100 active" style="background: gainsboro;margin-top:5px;">
                                        <a class=" active show" id="general-info-tab" data-toggle="tab" href="#general-info" role="tab" aria-controls="general-info" aria-selected="true">
                                            General Information
                                        </a>
                                    </li>
                                    <li class="w-100" style="background: gainsboro;margin-top:5px;">
                                        <a class="" id="eligibility-info-tab" data-toggle="tab" href="#eligibility-info" role="tab" aria-controls="eligibility-info" aria-selected="false">
                                            Eligibility-info
                                        </a>
                                    </li>
                                    <li class="w-100" style="background: gainsboro;margin-top:5px;">
                                        <a class="" id="official-documents-tab" data-toggle="tab" href="#official-documents" role="tab" aria-controls="official-documents" aria-selected="false">
                                            Official Documents
                                        </a>
                                    </li>
                                    <li class="w-100" style="background: gainsboro;margin-top:5px;">
                                        <a class="" id="track-history-tab" data-toggle="tab" href="#track-history" role="tab" aria-controls="track-history" aria-selected="false">
                                            Track History
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-md-2">
                            </div>

                            <div class="col-md-8">
                                <div class="tab-content" id="student-details-tabs-content">
                                    <div class="tab-pane panel fade active in" id="general-info" role="tabpanel" aria-labelledby="general-info-tab">
                                        <div class="card">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row" style="display: flex;align-items: center;">
                                                    <div class="col-md-2">
                                                        <img src="{{ $user_avatar }}" style="height: 100px;object-fit: cover;width: auto;">
                                                    </div>
                                                    <div class="col-md-10">
                                                        <h3> Student Status :  <span id="status"> Applicant </span> </h3>
                                                        <h4> Referred by: <span id="reffered_by"> ( CENTER DIRECTOR ) </span> </h4>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label>Title</label>
                                                        <input type="text" class="form-control" value="Mr." readonly="readonly">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>First Name</label>
                                                        <input type="text" class="form-control" value="Al" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label>Middle Name</label>
                                                        <input type="text" class="form-control" value="Kafi" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label>Surname</label>
                                                        <input type="text" class="form-control" value="Sohag" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Student ID</label>
                                                        <input type="text" class="form-control" value="#202201" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Email</label>
                                                        <input type="text" class="form-control" value="student@gmail.com" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Contact Number</label>
                                                        <input type="text" class="form-control" value="+8801234567890" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Emergency Contact</label>
                                                        <input type="text" class="form-control" value="+8809876543210" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Gender</label>
                                                        <input type="text" class="form-control" value="Male" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Date of Birth (dd/mm/yyyy)</label>
                                                        <input type="text" class="form-control" value="15/02/2001" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Country of Birth</label>
                                                        <input type="text" class="form-control" value="Bangladesh" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Age</label>
                                                        <input type="text" class="form-control" value="23" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label>Address</label>
                                                        <input type="text" class="form-control" value="Fulbari, Kurigram" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label>Postcode</label>
                                                        <input type="text" class="form-control" value="1234" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>City</label>
                                                        <input type="text" class="form-control" value="Dhaka" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>Country</label>
                                                        <input type="text" class="form-control" value="Bangladesh" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="eligibility-info" role="tabpanel" aria-labelledby="eligibility-info-tab">
                                        <div class="card">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <h3> Last Qualification</h3>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label>Last Qualification Achieved</label>
                                                        <input type="text" class="form-control" value="B.Sc ( Engineering ) in Electronics and Communication Engineering" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label> Awarding Body / Institute</label>
                                                        <input type="text" class="form-control" value="Hajee Mohammad Danesh Science and Technology Univercity" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Awarding Country</label>
                                                        <input type="text" class="form-control" value="Bangladesh" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Date of Awarded</label>
                                                        <input type="text" class="form-control" value="20-05-2022" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Qualification Result</label>
                                                        <input type="text" class="form-control" value="3.04" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Out of</label>
                                                        <input type="text" class="form-control" value="4.00" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <h3> English Proficiency </h3>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label>English Proficiency Test</label>
                                                        <input type="text" class="form-control" value="IELTS" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label>Written Result</label>
                                                        <input type="text" class="form-control" value="6" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>CiListening Resultty</label>
                                                        <input type="text" class="form-control" value="6" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>Reading Result</label>
                                                        <input type="text" class="form-control" value="6" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="official-documents" role="tabpanel" aria-labelledby="official-documents-tab">



                                    </div>
                                    <div class="tab-pane fade" id="track-history" role="tabpanel" aria-labelledby="track-history">



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@stop

@section('css')

@stop

@section('javascript')
<script>

</script>
@stop
