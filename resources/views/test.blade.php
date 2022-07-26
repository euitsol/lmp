@extends('voyager::master')

@section('css')
    <style></style>
@stop

@section('page_title', 'Your title')

@section('page_header')
    <h1 class="page-title">
        <i class="fa fa-home"></i>
        Test
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
<div class="page-content container-fluid">
    <h1>Your content</h1>
</div>
@stop
