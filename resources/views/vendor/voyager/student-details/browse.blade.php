@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ $dataType->getTranslatedAttribute('display_name_plural') }}
    </h1>

    @include('voyager::multilingual.language-selector')

@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">

                        <div class="table-responsive">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="align-middle">SL.</th>
                                        <th class="align-middle">ID / NAME / EMAIL / PHONE NUMBER</th>
                                        <th class="align-middle">STATUS</th>
                                        <th class="align-middle">REFERRED BY</th>
                                        <th class="align-middle">CENTER NAME</th>
                                        <th class="align-middle">ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($dataTypeContent as $key => $data)
                                    <tr>
                                        <td class="align-middle">{{ $key+1 }}</td>
                                        <td class="align-middle" style="text-align: left;">
                                            #{{ $data->id }} <br>
                                            {{ $data->name }} <br>
                                            {{ $data->email }} <br>
                                            +{{ $data->country_code }} {{ $data->tel }}
                                        </td>
                                        <td class="align-middle">{{ $data->student_details->status }}</td>
                                        <td class="align-middle">
                                            {{ $data->student_details->center->director_info->name }} <br>
                                            <br>
                                            Center Director
                                        </td>
                                        <td class="align-middle">{{ $data->student_details->center->name }}</td>
                                        <td class="align-middle">
                                            <a href="{{ route('admin.student.details', $data->id) }}" title="View" class="btn btn-sm btn-warning view">
                                                <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                                            </a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
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
    $(document).ready(function () {
        var table = $('#dataTable').DataTable();
     });
</script>
@stop
