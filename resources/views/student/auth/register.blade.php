@extends('student.auth.master')

@section('pre_css')
{{-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> --}}
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/css/intlTelInput.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css" integrity="sha512-Ujn3LMQ8mHWqy7EPP32eqGKBhBU8v39JRIfCer4nTZqlsSZIwy5g3Wz9SaZrd6pp3vmjI34yyzguZ2KQ66CLSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    {!! RecaptchaV3::initJs() !!}
    <link rel="stylesheet" href="{{ asset('assets/icheck-bootstrap-3.0.1/icheck-bootstrap.min.css') }}">
    <style>
        .iti{
            width: 100%;
        }
        .form-control, .select2-container{
            border: 1px solid #ced4da !important;
            border-radius: 3px;
        }

    </style>
@stop

@section('content')
    <div class="login-container">

        <p>Please fill out the form</p>

        <form action="{{ route('student.register.store') }}" method="POST">
            {{ csrf_field() }}
            <div class="form-group">
                <label for="name">Name<span class="text-danger">*</span></label>
                <div class="controls">
                    <input type="text" name="name" id="name" value="{{ old('name') }}" placeholder="Please Enter Your Name" class="form-control" autocomplete="off" required >
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email<span class="text-danger">*</span></label>
                <div class="controls">
                    <input type="email" name="email" id="email" value="{{ old('email') }}" placeholder="Please Provide Your Email" class="form-control" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <label for="tel">Phone<span class="text-danger">*</span></label>
                <input class="form-control tel" type="tel" name="tel" inputmode="tel" id="tel" value="{{ old('tel') }}" autocomplete="off" required/>
                <input type="hidden" name="country_code" id="country_code" value="">
            </div>

            <div class="form-group">
                <label for="dob">Date of birth<span class="text-danger">*</span></label>
                <input class="form-control datepicker-here" type="text" name="dob" id="datepicker" placeholder="YYYY-MM-DD" value="{{ old('dob') }}"  data-language='en' data-position='top left' autocomplete="off" required/>
            </div>
            <div class="form-group row">
                <div class="col-md-6">
                    <label for="country">Preferable Country<span class="text-danger">*</span></label>
                    <select name="country" class="form-control country" id="country" required>
                    </select>

                </div>
                <div class="col-md-6">
                    <label for="city">Preferable City<span class="text-danger">*</span></label>
                    <select name="city" name="city" class="city form-control" id="city" disabled="disabled" placeholder="Select city" required>
                        <option value="" disabled selected>Select city</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="reference">Reference Code<span class="text-danger">*</span></label>
                <div class="d-flex justify-space-between align-items-center">
                <input class="form-control" type="text" name="reference" id="reference" placeholder="Please add reference code" autocomplete="off" value="{{ old('reference') }}" required/>
                <button class="btn btn-primary reference_spinner" style="display: none; margin-left: 5px;" type="button" disabled="disabled">
                    <span class="spinner-border spinner-border-sm" role="true" aria-hidden="false"></span>
                </button>
                </div>
                <input type="hidden" name="center_id" id="center_id" value="">
            </div>

            <div class="form-group">
                <label for="password">Password<span class="text-danger">*</span></label>
                <input class="form-control" type="password" name="password" id="password" placeholder="********" value="{{ old('password') }}" autocomplete="off" required/>
                <div id="pswmeter-message"></div>
                <div id="pswmeter"></div>
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password<span class="text-danger">*</span></label>
                <input class="form-control" type="password" name="confirm_password" id="confirm_password" placeholder="********" value="{{ old('password') }}" required/>
            </div>

            <div class="form-group{{ $errors->has('g-recaptcha-response') ? ' has-error' : '' }}">
                <div class="g-recaptcha" data-sitekey="{!! env('RECAPTCHAV3_SITEKEY') !!}"></div>
                <div class="col-md-12">
                    {!! RecaptchaV3::field('register') !!}
                    @if ($errors->has('g-recaptcha-response'))
                        <span class="help-block">
                            <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group">
                <div class="checkbox icheck-peterriver">
                    <input type="checkbox" value="1" name="accept_term_cond" id="accept_term_cond" required>
                    <label class="form-check-label" for="accept_term_cond">I agree to <a href="#" target="_blank">privacy policy & terms</a></label>
                </div>
            </div>

            <button type="submit" class="btn btn-block btn-info login-button" style="width:100%; background:{{ config('voyager.primary_color','#22A7F0') }}; color: #fff">
                <span class="signingin hidden"><span class="voyager-refresh"></span> ...</span>
                <span class="signin">Register</span>
            </button>

        </form>

        <div style="clear:both"></div>

        @if(!$errors->isEmpty())
            <div class="alert alert-red">
                <ul class="list-unstyled">
                    @foreach($errors->all() as $err)
                        <li>{{ $err }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

    </div> <!-- .login-container -->
@endsection

@section('post_js')

    <script>
        // var btn = document.querySelector('button[type="submit"]');
        // var form = document.forms[0];
        // var email = document.querySelector('[name="email"]');
        // var password = document.querySelector('[name="password"]');
        // btn.addEventListener('click', function(ev){
        //     if (form.checkValidity()) {
        //         btn.querySelector('.signingin').className = 'signingin';
        //         btn.querySelector('.signin').className = 'signin hidden';
        //     } else {
        //         ev.preventDefault();
        //     }
        // });
        // email.focus();
        // document.getElementById('emailGroup').classList.add("focused");

        // // Focus events for email and password fields
        // email.addEventListener('focusin', function(e){
        //     document.getElementById('emailGroup').classList.add("focused");
        // });
        // email.addEventListener('focusout', function(e){
        //     document.getElementById('emailGroup').classList.remove("focused");
        // });

        // password.addEventListener('focusin', function(e){
        //     document.getElementById('passwordGroup').classList.add("focused");
        // });
        // password.addEventListener('focusout', function(e){
        //     document.getElementById('passwordGroup').classList.remove("focused");
        // });

    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/intlTelInput.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/4.0.8/jquery.inputmask.bundle.min.js"></script>
    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js" integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> --}}
    {{-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> --}}
    {{-- <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script> --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js" integrity="sha512-sM9DpZQXHGs+rFjJYXE1OcuCviEgaXoQIvgsH7nejZB64A09lKeTU4nrs/K6YxFs6f+9FF2awNeJTkaLuplBhg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js" integrity="sha512-6+P1bat5JJUm3ZeQKup1qbRitLnE7NE8z47htcKFs8LqH/XAbauzUfg1tGdXJKDJlecq9I/lTm9iCO/0uuho/w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script src="{{ asset('assets/pswmeter-master/pswmeter.js') }}"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
    <script>
        $('#reference').on('keyup', function() {
            let reference = $(this).val();
            if(reference != '' && reference.length == 6){
                validateReference(true);
                let url = "{{ route('student.reference') }}";
                $.ajax({
                url: url,
                method: "POST",
                data: {
                    reference: reference
                },
                beforeSend: function() {
                    $('.reference_spinner').show();
                },
                complete: function(){
                    $('.reference_spinner').hide();
                },

                success: function (response) {
                    if(response != ''){
                        validateReference(true);
                        $('#reference').prop('disabled', true);
                        $('#center_id').val(response);
                    }else{
                        validateReference(false);
                    }
                },
                error: function (response){
                    console.log(response);
                }
            });
            }else{
                validateReference(false);
            }
        });

        var reference = document.getElementById("reference");

        function validateReference(result){
            if(result == false) {
                reference.setCustomValidity("Invalid Reference Code");
            } else {
                reference.setCustomValidity('');
                }
        }
    </script>
    <script>
        $('.country').change(function (){
            if($(this).val() != null){
                $('.city').removeAttr('disabled');
                var country_id = $(this).val();
                var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
                $('.city').select2({
                    placeholder: 'Select city',
                    ajax: {
                        url: '{{ route('student.cities') }}',
                        type: "post",
                        dataType: 'json',
                        delay: 250,
                        data: function (params) {
                            return {
                                _token: CSRF_TOKEN,
                                search: params.term, // search term
                                id: country_id

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
            }else{
                $('.city').prop('disabled', 'disabled');
            }
        });
    </script>
    <script>
            var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
            $('.country').select2({
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

    </script>
    <script>
        var password = document.getElementById("password");
        var confirm_password = document.getElementById("confirm_password");

    function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
    </script>
    <script>

        // Run pswmeter with options
        const myPassMeter = passwordStrengthMeter({
          containerElement: '#pswmeter',
          passwordInput: '#password',
          showMessage: false,
          messageContainer: '#pswmeter-message',
          messagesList: [
            'Write your password...',
            'Easy peasy!',
            'That is a simple one',
            'That is better',
            'Yeah! that password rocks ;)'
          ],
          height: 6,
          borderRadius: 3,
          pswMinLength: 6,
          colorScore1: '#C70039 ',
          colorScore2: '#FFC300',
          colorScore3: '#11F397',
          colorScore4: '#097612'
        });

        </script>
    <script>

    </script>
    <script>
    $(function() {
        let datepicker = $( "#datepicker" ).datepicker({
            dateFormat: "yyyy-mm-dd",
            maxDate: new Date()
        });
    });
    </script>
    <script>

        $(function () {


            /*
             * International Telephone Input v16.0.0
             * https://github.com/jackocnr/intl-tel-input.git
             * Licensed under the MIT license
            */
            var input = document.querySelectorAll("input[name=tel]");
            var iti_el = $('.iti.iti--allow-dropdown.iti--separate-dial-code');
            if(iti_el.length){
                iti.destroy();

                // Get the current number in the given format



            }
            for(var i = 0; i < input.length; i++){
                iti = intlTelInput(input[i], {
                    autoHideDialCode: false,
                    autoPlaceholder: "aggressive" ,
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


                $('input[name="tel"]').on("focus click countrychange", function(e, countryData) {

                    var pl = $(this).attr('placeholder') + '';
                    var res = pl.replace( /X/g ,'9');
                    if(res != 'undefined'){
                        $(this).inputmask(res, {placeholder: "X", clearMaskOnLostFocus: true});
                    }

                    var countryData = iti.getSelectedCountryData();
                    $('#country_code').val(countryData.dialCode);
                });

            }


            // Date picker


        });
    </script>
@endsection
