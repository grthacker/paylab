@extends($activeTemplate . 'layouts.master')

@section('content')
    <section class="pt-100 pb-100 section--bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-8">
                    <div class="card main-card border-top-0">
                        <div class="card-body">

                            <form action="{{url('user/change-mpin')}}" method="post" >
                                @csrf
                                <div class="form-group">
                                    <label for="password">@lang('Current MPIN')</label>
                                    <div class="custom-icon-field">
                                        <i class="las la-key"></i>
                                        <input id="password" type="password" placeholder="Current MPIN"
                                            class="form-control" name="current_mpin" pattern="\d{4}"
                                            title="Please enter a 4-digit number" required autocomplete="current-password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirm_password">@lang('MPIN')</label>
                                    <div class="custom-icon-field">
                                        <i class="las la-lock"></i>
                                        <input id="confirm_password" type="password" placeholder="New MPIN"
                                            class="form-control" name="mpin" pattern="\d{4}"
                                            title="Please enter a 4-digit number" required autocomplete="current-password">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="confirm_password">@lang('Confirm MPIN')</label>
                                    <div class="custom-icon-field">
                                        <i class="las la-lock"></i>
                                        <input id="password_confirmation" placeholder="Confirm MPIN" type="password"
                                            class="form-control" name="mpin_confirmation"  pattern="\d{4}"
                                            title="Please enter a 4-digit number" required
                                            autocomplete="current-password">
                                    </div>
                                </div>
                                <div class="form-group mb-0">
                                    <input type="submit" class="mt-3 btn bg-primary w-100 cmn-btn text-white"
                                        value="@lang('Change MPIN')">
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

@endpush
