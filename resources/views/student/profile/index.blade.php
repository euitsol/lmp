@extends('student.master')

@section('page_title', 'Student Profile')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="{{ $data['menu']->icon_class }}"></i> Profile
        </h1>
        @include('voyager::multilingual.language-selector')
    </div>
@stop

@section('css')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/css/intlTelInput.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css" integrity="sha512-Ujn3LMQ8mHWqy7EPP32eqGKBhBU8v39JRIfCer4nTZqlsSZIwy5g3Wz9SaZrd6pp3vmjI34yyzguZ2KQ66CLSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
    .iti, .select2{
        width: 100% !important;
    }
</style>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-header">

                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-2 panel pt-2 pb-2">
                                <ul class="nav nav-tabs card-header-tabs bg-white" id="student-details-tabs" role="tablist" style="background: transparent;">
                                    <li class="w-100 active" style="background: gainsboro;margin-top:5px;">
                                        <a class=" active show" id="account-info-tab" data-toggle="tab" href="#account-info" role="tab" aria-controls="account-info" aria-selected="true">
                                            Account Information
                                        </a>
                                    </li>
                                    <li class="w-100" style="background: gainsboro;margin-top:5px;">
                                        <a class="" id="general-info-tab" data-toggle="tab" href="#general-info" role="tab" aria-controls="general-info" aria-selected="false">
                                            General Information
                                        </a>
                                    </li>
                                    <li class="w-100" style="background: gainsboro;margin-top:5px;">
                                        <a class="" id="educational-info-tab" data-toggle="tab" href="#educational-info" role="tab" aria-controls="educational-info" aria-selected="false">
                                            Educational Information
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-md-2">
                            </div>

                            <div class="col-md-8">
                                <div class="tab-content" id="student-details-tabs-content">
                                    <div class="tab-pane panel fade active in" id="account-info" role="tabpanel" aria-labelledby="account-info-tab">
                                        <div class="card">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th>Student ID:</th>
                                                            <td>#{{ date('Y', strtotime($data['info']->created_at)).$data['info']->id }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Username:</th>
                                                            <td>{{ $data['info']->name }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Email Address:</th>
                                                            <td>{{ $data['info']->email }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Phone Number:</th>
                                                            <td>+{{ $data['info']->country_code.$data['info']->tel }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Date of Birth:</th>
                                                            <td>{{ date('Y - M - d', strtotime($data['info']->dob)) }}</td>
                                                        </tr>

                                                        <tr>
                                                            <th>City:</th>
                                                            <td>{{ $data['info']->city_details->name }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th class="">Country:</th>
                                                            <td class="">{{ $data['info']->country_details->name }}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane panel fade" id="general-info" role="tabpanel" aria-labelledby="general-info-tab">
                                        <div class="card">
                                            <div class="row">
                                            <form action="{{ route('student.profile.update') }}" method="POST">
                                            @csrf
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label>First Name</label>
                                                            <input type="text" class="form-control" value="{{ $data['details']->f_name ?? '' }}" name="fname" id="fname">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Middle Name</label>
                                                            <input type="text" class="form-control" value="{{ $data['details']->m_name ?? '' }}" name="mname" id="mname">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Surname</label>
                                                            <input type="text" class="form-control" value="{{ $data['details']->s_name ?? '' }}" name="lname" id="lname">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label>Title</label>
                                                            <select class="select2 form-control" name="title" id="title">
                                                                <option value="1" @if($data['details']->title == 1) selected @endif>Mr.</option>
                                                                <option value="2" @if($data['details']->title == 2) selected @endif>Ms.</option>
                                                                <option value="3" @if($data['details']->title == 3) selected @endif>Mrs.</option>
                                                                <option value="4" @if($data['details']->title == 4) selected @endif>Miss.</option>
                                                                <option value="5" @if($data['details']->title == 5) selected @endif>Dr.</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Gender</label>
                                                            <select class="select2 form-control" name="gender" id="gender">
                                                                <option value="1" @if($data['details']->gender == 1) selected @endif>Male</option>
                                                                <option value="2" @if($data['details']->gender == 2) selected @endif>Female</option>
                                                                <option value="3" @if($data['details']->gender == 3) selected @endif>Other</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 form-group">
                                                            <label>Country of Birth</label>
                                                            <select class="form-control" name="birth_country" id="birth_country">
                                                                <option value="{{ $data['details']->birth_country }} " hidden selected>{{ $data['details']->birth_country_details->name }}</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Postcode</label>
                                                            <input type="text" class="form-control" name="post_code" value="{{ $data['details']->postcode ?? '' }}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label>Age</label>
                                                            <input type="text" class="form-control" name="age" value="{{ $data['details']->age ?? \Carbon\Carbon::parse($data['info']->dob)->diff(\Carbon\Carbon::now())->format('%y') }}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Emergency Contact</label>
                                                                <input class="form-control tel" type="tel" name="e_contact" inputmode="tel" id="tel"  autocomplete="off"/>
                                                                <input type="hidden" name="e_country_code" id="e_country_code" value="{{ $data['details']->e_country_code ?? '' }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label>Address</label>
                                                            <textarea class="form-control" name="address" rows="3">{{ $data['details']->address ?? '' }}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <span class="float-left">
                                                                <input type="submit" class="btn btn-info" value="Save Changes">
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane panel fade" id="educational-info" role="tabpanel" aria-labelledby="educational-info-tab">
                                        <div class="card">
                                            <div class="row">
                                            <form action="{{ route('student.education.update') }}" method="POST">
                                            @csrf
                                                <div class="col-md-12">
                                                    <h4> Educational Qualifications </h4>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label>Last Qualification Level</label>
                                                            <select class="form-control edu_level" name="edu_level">
                                                                @if(isset($data['details']->edu_level_details->id)) <option value="{{ $data['details']->edu_level_details->id }}" hidden selected> {{ $data['details']->edu_level_details->name }}</option> @endif
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Dergree name</label>
                                                            <input type="text" class="form-control" name="edu_degree" value="{{ $data['details']->edu_degree ?? '' }}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label>Awarding Body / Institute</label>
                                                            <input type="text" class="form-control" name="edu_awarding_body" value="{{ $data['details']->edu_awarding_body ?? '' }}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Awarding Country</label>
                                                            <select class="form-control awarding_country" name="edu_awarding_country">
                                                                @if(isset($data['details']->awarding_country_details->id)) <option value="{{ $data['details']->awarding_country_details->id }}" hidden selected> {{ $data['details']->awarding_country_details->name }}</option> @endif
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label>Qualification Result</label>
                                                            <input type="number" class="form-control" name="edu_qualification_result"  value="{{ $data['details']->edu_qualification_result ?? '' }}" step="0.01">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Result Out of</label>
                                                            <input type="number" class="form-control" name="edu_qualification_result_outof"  value="{{ $data['details']->edu_qualification_result_outof ?? '' }}" step="0.01">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label>Date of Awarded (dd-mm-yy)</label>
                                                            <input class="form-control datepicker-here" type="text" name="edu_qualification_date" id="datepicker" placeholder="DD-MM-YY" value="{{ $data['details']->edu_qualification_date ?? '' }}"  data-language='en' data-position='top left' autocomplete="off">

                                                        </div>
                                                    </div>
                                                    <br>
                                                    <h4> English Proficiency Test </h4>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label>Test Type</label>
                                                            <select class="form-control edu_eng_test" name="edu_eng_test">
                                                                @if(isset($data['details']->eng_test_details->id)) <option value="{{ $data['details']->eng_test_details->id }}" hidden selected> {{ $data['details']->eng_test_details->name }}</option> @endif
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label>Written Result</label>
                                                            <input class="form-control" placeholder="Enter if available" type="number" name="edu_eng_writting_result" value="{{ $data['details']->edu_eng_writting_result ?? '' }}" step="0.01">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Listening Result</label>
                                                            <input class="form-control" placeholder="Enter if available" type="number" name="edu_eng_listening_result" value="{{ $data['details']->edu_eng_listening_result ?? '' }}" step="0.01">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Reading Result</label>
                                                            <input class="form-control" placeholder="Enter if available" type="number" name="edu_eng_reading_result" value="{{ $data['details']->edu_eng_reading_result ?? '' }}" step="0.01">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Spoken Result</label>
                                                            <input class="form-control" placeholder="Enter if available" type="number" name="edu_eng_spoken_result" value="{{ $data['details']->edu_eng_spoken_result ?? '' }}" step="0.01">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Other Result</label>
                                                            <input class="form-control" placeholder="Enter if available" type="number" name="edu_eng_other_result" value="{{ $data['details']->edu_eng_other_result ?? '' }}" step="0.01">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Date Of Exam (dd-mm-yy)</label>
                                                            <input class="form-control datepicker-here" type="text" name="edu_eng_exam_date" id="exam_datepicker" placeholder="DD-MM-YY" value="{{ date('y-m-d', strtotime($data['details']->edu_eng_exam_date)) }}"  data-language='en' data-position='top left' autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <span class="float-left">
                                                                <input type="submit" class="btn btn-info" value="Save Changes">
                                                            </span>
                                                        </div>
                                                    </div>

                                                </div>

                                            </form>
                                            </div>
                                        </div>
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

@section('javascript')
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/intlTelInput.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/4.0.8/jquery.inputmask.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js" integrity="sha512-sM9DpZQXHGs+rFjJYXE1OcuCviEgaXoQIvgsH7nejZB64A09lKeTU4nrs/K6YxFs6f+9FF2awNeJTkaLuplBhg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js" integrity="sha512-6+P1bat5JJUm3ZeQKup1qbRitLnE7NE8z47htcKFs8LqH/XAbauzUfg1tGdXJKDJlecq9I/lTm9iCO/0uuho/w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

   var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
            $('#birth_country').select2({
              placeholder: 'Select country',
              ajax: {
                url: '{{ route('student.countries') }}',
                type: "post",
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        _token: CSRF_TOKEN,
                        search: params.term // search term

                    };
                },
                processResults: function (data) {
                  return {
                    results:  $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.id
                        }
                      })
                  };
                },
                cache: true
              }
            });
            $('.edu_level').select2({
              placeholder: 'Select Last Qualification Level',
              ajax: {
                url: '{{ route('student.edu_level.level') }}',
                type: "post",
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        _token: CSRF_TOKEN,
                        search: params.term // search term

                    };
                },
                processResults: function (data) {
                    console.log(data);
                  return {
                    results:  $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.id
                        }
                      })
                  };
                },
                cache: true
              }
            });
            $('.awarding_country').select2({
              placeholder: 'Select Awarding Country Name',
              ajax: {
                url: '{{ route('student.countries') }}',
                type: "post",
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        _token: CSRF_TOKEN,
                        search: params.term // search term

                    };
                },
                processResults: function (data) {
                    console.log(data);
                  return {
                    results:  $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.id
                        }
                      })
                  };
                },
                cache: true
              }
            });
            $('.edu_eng_test').select2({
              placeholder: 'Select English Test Type',
              ajax: {
                url: '{{ route('student.eng_test') }}',
                type: "post",
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        _token: CSRF_TOKEN,
                        search: params.term // search term

                    };
                },
                processResults: function (data) {
                    console.log(data);
                  return {
                    results:  $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.id
                        }
                      })
                  };
                },
                cache: true
              }
            });
</script>
<script>

    $(function () {


        /*
         * International Telephone Input v16.0.0
         * https://github.com/jackocnr/intl-tel-input.git
         * Licensed under the MIT license
        */
        var input = document.querySelectorAll("input[name=e_contact]");
        var iti_el = $('.iti.iti--allow-dropdown.iti--separate-dial-code');
        if(iti_el.length){
            iti.destroy()
        }
        for(var i = 0; i < input.length; i++){
            iti = intlTelInput(input[i], {
                autoHideDialCode: false,
                autoPlaceholder: 'aggressive' ,
                // customPlaceholder:'{{ $data['details']->e_contact ?? '' }}',
                separateDialCode: true,
                preferredCountries: ['bd'],
                customPlaceholder:function(selectedCountryPlaceholder,selectedCountryData){
                    return ''+selectedCountryPlaceholder.replace(/[0-9]/g,'X');
                },
                geoIpLookup: function(callback) {
                    $.get('https://ipinfo.io', function() {}, "jsonp").always(function(resp) {
                      var countryCode = (resp && resp.country) ? resp.country : "";
                      callback(countryCode);
                  });
                },
                utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/utils.js" // just for
            });


            $('input[name="e_contact"]').on("focus click countrychange focusout", function(e, countryData) {

                var pl = $(this).attr('placeholder') + '';
                var res = pl.replace( /X/g ,'9');
                if(res != 'undefined'){
                    $(this).inputmask(res, {placeholder: "X", clearMaskOnLostFocus: true});
                }

                var countryData = iti.getSelectedCountryData();
                $('#e_country_code').val(countryData.dialCode);

                var isValid = iti.isValidNumber();
                console.log(isValid);
            });



        }


        // Date picker


    });
</script>
<script>
$(function() {
    let datepicker = $( "#datepicker, #exam_datepicker" ).datepicker({
        dateFormat: "dd-mm-yyyy",
    });

});
</script>
@stop
