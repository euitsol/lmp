<nav class="navbar navbar-default navbar-fixed-top navbar-top custom-navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="hamburger btn-link">
                <span class="hamburger-inner"></span>
            </button>
            @section('breadcrumbs')
            <ol class="breadcrumb hidden-xs">
                @php
                $segments = array_filter(explode('/', str_replace(route('voyager.dashboard'), '', Request::url())));
                $url = route('voyager.dashboard');
                @endphp
                @if(count($segments) == 0)
                    <li class="active"><i class="voyager-boat"></i> {{ __('voyager::generic.dashboard') }}</li>
                @else
                    <li class="active">
                        <a href="{{ route('voyager.dashboard')}}"><i class="voyager-boat"></i> {{ __('voyager::generic.dashboard') }}</a>
                    </li>
                    @foreach ($segments as $segment)
                        @php
                        $url .= '/'.$segment;
                        @endphp
                        @if ($loop->last)
                            <li>{{ ucfirst(urldecode($segment)) }}</li>
                        @else
                            <li>
                                <a href="{{ $url }}">{{ ucfirst(urldecode($segment)) }}</a>
                            </li>
                        @endif
                    @endforeach
                @endif
            </ol>
            @show
        </div>
        <div class="d-flex justify-content-center profile-col">
        <ul class="nav navbar-nav right-nav @if (__('voyager::generic.is_rtl') == 'true') navbar-left @else navbar-right @endif">

            <li class="dropdown profile">
                <a href="#"><i class="fa-solid fa-circle-half-stroke"></i></a>
            </li>
            <li class="dropdown profile notification">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        <i class="fa-solid fa-bell "></i>
                        <span class="badge label-danger">3</span>
                    </a>


                {{-- <div class=" dropdown-menu dropdown-menu-animated" data-dropdown-in="fadeIn" >
                        <h4>Notifications</h4>
                        <div class="text">
                            <p>Samso Nagaro Like your home work</p>
                        </div>
                        <div class="text">
                            <p>Samso Nagaro Like your home work</p>
                        </div>
                        <div class="text">
                            <p>Samso Nagaro Like your home work</p>
                        </div>
                        <div class="text">
                            <p>Samso Nagaro Like your home work</p>
                        </div>

                </div> --}}
                <div class=" dropdown-menu dropdown-menu-animated" data-dropdown-in="fadeIn" style="left: -230% !important;">
                    <h4 class="dropdown-header">
                        Notifications
                    </h4>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3 notification-icon">
                            <div class="icon-circle bg-primary d-flex align-items-center">
                                <i class="fas fa-file-alt text-white"></i>
                            </div>
                        </div>
                        <div class="notification-text">
                            <div class="small text-gray-500">December 12, 2019</div>
                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3 notification-icon">
                            <div class="icon-circle bg-success d-flex align-items-center">
                                <i class="fas fa-donate text-white"></i>
                            </div>
                        </div>
                        <div class="notification-text">
                            <div class="small text-gray-500">December 7, 2019</div>
                            $290.29 has been deposited into your account!
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3 notification-icon">
                            <div class="icon-circle bg-warning d-flex align-items-center">
                                <i class="fas fa-exclamation-triangle text-white"></i>
                            </div>
                        </div>
                        <div class="notification-text">
                            <div class="small text-gray-500">December 2, 2019</div>
                            Spending Alert: We've noticed unusually high spending for your account.
                        </div>
                    </a>
                    <a class="dropdown-item text-center small text-gray-500 showall-notice" href="#">Show All Alerts</a>
                </div>
            </li>

            <li class="dropdown profile">
                <a href="#" class="dropdown-toggle text-right" data-toggle="dropdown" role="button"
                   aria-expanded="false">
                   <img src="{{ $user_avatar }}" class="profile-img">
                   {{ Auth::user()->name }}
                   <span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-animated">
                    <li class="profile-img">
                        <img src="{{ $user_avatar }}" class="profile-img">
                        <div class="profile-body">
                            <h5>{{ Auth::user()->name }}</h5>
                            <h6>{{ Auth::user()->email }}</h6>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <?php $nav_items = config('voyager.dashboard.navbar_items'); ?>
                    @if(is_array($nav_items) && !empty($nav_items))
                    @foreach($nav_items as $name => $item)
                    <li {!! isset($item['classes']) && !empty($item['classes']) ? 'class="'.$item['classes'].'"' : '' !!}>
                        @if(isset($item['route']) && $item['route'] == 'voyager.logout')
                        <form action="{{ route('voyager.logout') }}" method="POST">
                            {{ csrf_field() }}
                            <button type="submit" class="btn btn-danger btn-block">
                                @if(isset($item['icon_class']) && !empty($item['icon_class']))
                                <i class="{!! $item['icon_class'] !!}"></i>
                                @endif
                                {{__($name)}}
                            </button>
                        </form>
                        @else
                        <a href="{{ isset($item['route']) && Route::has($item['route']) ? route($item['route']) : (isset($item['route']) ? $item['route'] : '#') }}" {!! isset($item['target_blank']) && $item['target_blank'] ? 'target="_blank"' : '' !!}>
                            @if(isset($item['icon_class']) && !empty($item['icon_class']))
                            <i class="{!! $item['icon_class'] !!}"></i>
                            @endif
                            {{__($name)}}
                        </a>
                        @endif
                    </li>
                    @endforeach
                    @endif
                </ul>
            </li>
        </ul>
        </div>
    </div>
</nav>
