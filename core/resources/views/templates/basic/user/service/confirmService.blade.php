@extends($activeTemplate . 'layouts.master')
@section('content')


    <section class="pt-120 pb-120 section--bg">
        <div class="container">

            <div class="deposit-preview py-5">

                @if ($service->description)
                    <div class="row justify-content-center mb-5">
                        <div class="col-xxl-12 col-xl-8">
                            <div class="card main-card">
                                <div class="card-header">
                                    <h5 class="title m-0 cl-white">@lang('Instructions')</h5>
                                </div>
                                <div class="card-body">
                                    <p class="para">
                                        {!! $service->description !!}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif

                <div class="row justify-content-center mb-30-none">
                    <div class="col-lg-12 col-xl-8">
                        <div class="card main-card">
                            <div class="card-header">
                                <h6 class="title cl-white m-0">@lang('User Information') {{ $service->name }}</h6>
                            </div>
                            <div class="card-body">
                                {{-- <div class="meta-info">
                                    <div class="item">
                                        @lang('Current Balance'): <span class="font-weight-bold">{{ getAmount($user->balance) }}
                                            {{ __($general->cur_text) }}</span>
                                    </div>
                                    <div class="item">
                                        @lang('Balance will be'): <span
                                            class="font-weight-bold">{{ getAmount($user->balance -= $apply->after_charge) }}
                                            {{ __($general->cur_text) }}</span>
                                    </div>
                                </div> --}}
                                <form action="{{ route('user.service.submit') }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $service->id }}">
                                    <div class="investment-information m--10">


                                        @if ($service->id == 1)
                                            <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Operator')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <select name="{{ 'Operator' }}" required="" class="form-control"
                                                        id="operator-select">
                                                        <option value="">---@lang('Select ') {{ __('Operator') }}---
                                                        </option>
                                                        @foreach ($operator as $data)
                                                            <option value="{{ $data['billerId'] }}">
                                                                {{ ucfirst(__($data['billerName'])) }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Plans')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <select name="amount" required="" class="form-control"
                                                        id="plan-select">
                                                        <option value="">---@lang('Select ') {{ __('Plans') }}---
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        @endif
                                        @if ($service->id == 5)
                                            <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Operator')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <select name="{{ 'Operator' }}" required="" class="form-control"
                                                        id="operator-select">
                                                        <option value="">---@lang('Select ') {{ __('Operator') }}---
                                                        </option>
                                                        @foreach ($operator as $data)
                                                            <option value="{{ $data['billerId'] }}">
                                                                {{ ucfirst(__($data['billerName'])) }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        @endif
                                        @if ($service->id == 3)
                                            <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Operator')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <select name="{{ 'Operator' }}" required="" class="form-control"
                                                        id="operator-select">
                                                        <option value="">---@lang('Select ') {{ __('Operator') }}---
                                                        </option>
                                                        @foreach ($operator as $data)
                                                            <option value="{{ $data['billerId'] }}">
                                                                {{ ucfirst(__($data['billerName'])) }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        @endif

                                        @if ($service->id == 9 || $service->id == 13)
                                            @if ($service->select_field && $service->category->field_name)
                                                @php
                                                    $array = json_decode($service->select_field, true);
                                                    $fieldName = array_keys($array);
                                                    $fieldName = implode(' ', $fieldName);
                                                    $options = $array[$fieldName];
                                                @endphp
                                                <div class="investment-information-group">
                                                    <label class="invest-label">
                                                        {{ ucfirst(__($fieldName)) }}
                                                        <span class="">*</span>
                                                    </label>
                                                    <div class="investment-inner-group form-group">
                                                        <select name="{{ $fieldName }}" required=""
                                                            class="form-control">
                                                            <option value="">---@lang('Select ')
                                                                {{ __($fieldName) }}---</option>
                                                            @foreach ($options as $data)
                                                                <option value="{{ $data }}">
                                                                    {{ ucfirst(__($data)) }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            @endif
                                            {{-- <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Banks')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <select name="{{ 'Banks' }}" required="" class="form-control"
                                                        id="operator-select">
                                                        <option value="">---@lang('Select ') {{ __('Banks') }}---
                                                        </option>
                                                        @foreach ($operator as $data)
                                                            <option value="{{ $data['bankId'] }}">
                                                                {{ ucfirst(__($data['name'])) }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div> --}}
                                        @endif

                                        @if ($service->id == 6)
                                            <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Operator')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <select name="{{ 'Operator' }}" required="" class="form-control">
                                                        <option value="">---@lang('Select ') {{ __('Operator') }}---
                                                        </option>
                                                        @foreach ($operator as $data)
                                                            <option value="{{ $data['billerId'] }}">
                                                                {{ ucfirst(__($data['billerName'])) }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="investment-information-group">
                                                <label class="invest-label">
                                                    {{ ucfirst(__('Meter Number')) }}
                                                    <span class="">*</span>
                                                </label>
                                                <div class="investment-inner-group form-group">
                                                    <input type="text" name="meter" class="form-control"
                                                        placeholder="Meter Number">
                                                    <div id="meter-error" style="color: red; display: none;"></div>
                                                </div>
                                            </div>
                                        @endif
                                        @foreach (json_decode($service->user_data) as $k => $v)
                                            @if ($v->type == 'text')
                                                <div class="investment-information-group">
                                                    <label class="invest-label">
                                                        {{ __($v->field_level) }}
                                                        @if ($v->validation == 'required')
                                                            <span class="">*</span>
                                                        @endif
                                                    </label>
                                                    <div class="investment-inner-group form-group">
                                                        <input type="text" name="{{ $k }}"
                                                            class="form-control" value="{{ old($k) }}"
                                                            placeholder="{{ __($v->field_level) }}"
                                                            {{ $v->validation == 'required' ? 'required' : null }}>
                                                        @if ($errors->has($k))
                                                            <span class="text-danger">{{ __($errors->first($k)) }}</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            @elseif($v->type == 'textarea')
                                                <div class="investment-information-group">
                                                    <label class="invest-label">
                                                        {{ __($v->field_level) }}
                                                        @if ($v->validation == 'required')
                                                            <span class="">*</span>
                                                        @endif
                                                    </label>
                                                    <div class="investment-inner-group form-group">
                                                        <textarea name="{{ $k }}" class="form-control" placeholder="{{ __($v->field_level) }}" rows="3"
                                                            {{ $v->validation == 'required' ? 'required' : null }}>{{ old($k) }}</textarea>
                                                        @if ($errors->has($k))
                                                            <span class="text-danger">{{ __($errors->first($k)) }}</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            @elseif($v->type == 'file')
                                                <div class="investment-information-group">
                                                    <label class="invest-label">
                                                        {{ __($v->field_level) }}
                                                        @if ($v->validation == 'required')
                                                            <span class="">*</span>
                                                        @endif
                                                    </label>
                                                    <div class="investment-inner-group form-group">
                                                        <div class="img-input-div">

                                                            <div class="image-upload">
                                                                <div class="thumb">
                                                                    <div class="avatar-preview">
                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <div class="profilePicPreview"
                                                                                    id="display_image">
                                                                                    <span class="size_mention"></span>
                                                                                    <button type="button"
                                                                                        id="image_remove_id"
                                                                                        class="remove-image"><i
                                                                                            class="las la-times"></i></button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="avatar-edit">
                                                                        <input type="file" class="profilePicUpload"
                                                                            id="profilePicUpload{{ $loop->index == 0 ? null : $loop->index + 1 }}"
                                                                            accept=".png, .jpg, .jpeg"
                                                                            name="{{ $k }}">
                                                                        <label
                                                                            for="profilePicUpload{{ $loop->index == 0 ? null : $loop->index + 1 }}"
                                                                            id='image_btn'
                                                                            class="btn bg-primary text-white">@lang('Select')
                                                                            {{ __($v->field_level) }} </label>
                                                                        @lang('Supproted image .jpeg, .png, .jpg')
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    @if ($errors->has($k))
                                                        <br>
                                                        <span class="text-danger">{{ __($errors->first($k)) }}</span>
                                                    @endif
                                                </div>
                                            @endif
                                        @endforeach

                                    </div>

                                    <div class="investment-information-group">
                                        <button type="submit" class="cmn-btn btn-block">@lang('Confirm')</button>
                                    </div>

                            </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </section>

@endsection


@push('script')
    <script>
        (function($) {
            "use strict";

            $('#display_image').hide();

            $('#image_btn').on('click', function() {
                var classNmae = $('#display_image').attr('class');
                if (classNmae != 'profilePicPreview has-image') {
                    $('#display_image').hide();
                } else {
                    $('#display_image').show();
                }
            });

            $('#image_remove_id').on('click', function() {
                $('.profilePicPreview').hide();
            });

            function proPicURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var preview = $(input).parents('.thumb').find('.profilePicPreview');
                        $(preview).css('background-image', 'url(' + e.target.result + ')');
                        $(preview).addClass('has-image');
                        $(preview).hide();
                        $(preview).fadeIn(650);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $(".profilePicUpload").on('change', function() {
                proPicURL(this);
            });

            $(".remove-image").on('click', function() {
                $(this).parents(".profilePicPreview").css('background-image', 'none');
                $(this).parents(".profilePicPreview").removeClass('has-image');
                $(this).parents(".thumb").find('input[type=file]').val('');
            });

            $("form").on("change", ".file-upload-field", function() {
                $(this).parent(".file-upload-wrapper").attr("data-text", $(this).val().replace(/.*(\/|\\)/,
                    ''));
            });

        })(jQuery);
    </script>

    @if ($service->id == 1)
        <script>
            // Attach an event listener to the operator select box
            $('#operator-select').on('change', function() {
                var selectedOperator = $(this).val();
                $('.preloader').css('display', 'block').animate({
                    opacity: 1
                });
                $.ajax({
                    type: 'GET',
                    url: "{{ url('/getRechargePlan') }}",
                    data: {
                        operator: selectedOperator
                    },
                    success: function(data) {
                        $('.preloader').animate({
                            opacity: 0
                        }, 500, function() {
                            $(this).css('display', 'none'); // Hide the preloader
                        });
                        var plansSelect = $('#plan-select');
                        plansSelect.empty();

                        $.each(data, function(index, plan) {
                            var displayText = 'Rs. ' + plan.planAmount;
                            if (plan.dataBenefits) {
                                displayText += ' | Data: ' + plan.dataBenefits;
                            }
                            if (plan.planValidity) {
                                displayText += ' | Validity: ' + plan.planValidity;
                            }
                            plansSelect.append($('<option></option>').attr('value', plan.planAmount)
                                .text(displayText));
                        });
                    },
                    error: function(error) {
                        console.error('Error fetching plans:', error);
                    }
                });
            });
        </script>
    @endif

    <script>
        $(document).ready(function() {
            $('input[name="meter"]').on('change', function() {
                var meterNumber = $('input[name="meter"]').val();
                var operator = $('select[name="Operator"]').val();
                $('.preloader').css('display', 'block').animate({
                    opacity: 1
                });
                $.ajax({
                    url: '{{ url('/getBillEnquiry') }}',
                    method: 'GET',
                    data: {
                        meter: meterNumber,
                        operator: operator
                    },
                    success: function(response) {
                        $('.preloader').animate({
                            opacity: 0
                        }, 500, function() {
                            $(this).css('display', 'none'); // Hide the preloader
                        });
                        if (response.statuscode == 'ERR') {
                            $('#meter-error').text(response.status).css('display',
                                'block'); // Display the error message
                        } else {
                            $('input[name="meter_number"]').val(response.data
                                .BillNumber).prop('disabled', true);;
                            $('input[name="meter_owner_name"]').val(response.data
                                .CustomerName).prop('disabled', true);;
                            $('input[name="amount"]').val(response.data
                                .BillAmount).prop('disabled', true);;
                        }
                        // Handle the response from the API
                    },
                    error: function(error) {
                        // Handle any errors that occur during the API request
                    }
                });
            });
        });
    </script>
@endpush

@push('style')
    <style>
        .image-upload .thumb .profilePicPreview {
            width: 100%;
            height: 310px;
            display: block;
            border: 3px solid #f1f1f1;
            box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            background-size: cover !important;
            background-position: top;
            background-repeat: no-repeat;
            position: relative;
            overflow: hidden;
        }

        .image-upload .thumb .profilePicPreview.logoPicPrev {
            background-size: contain !important;
            background-position: center;
        }

        .image-upload .thumb .profilePicUpload {
            display: none;
        }

        .image-upload .thumb .avatar-edit label {
            text-align: center;
            line-height: 35px;
            font-size: 16px;
            cursor: pointer;
            padding: 2px 25px;
            width: 100%;
            border-radius: 5px;
            transition: all 0.3s;
            margin-top: 15px;
        }

        .image-upload .thumb .avatar-edit label:hover {
            transform: translateY(-3px);
        }

        .image-upload .thumb .profilePicPreview .remove-image {
            position: absolute;
            top: -9px;
            right: -9px;
            text-align: center;
            width: 55px;
            height: 55px;
            font-size: 24px;
            border-radius: 50%;
            background-color: #df1c1c;
            color: #fff;
            display: none;
        }

        .image-upload .thumb .profilePicPreview.has-image .remove-image {
            display: block;
        }
    </style>
@endpush
