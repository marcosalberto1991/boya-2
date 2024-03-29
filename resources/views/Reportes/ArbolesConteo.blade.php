@extends('layouts.app')
<meta charset="utf-8">
    <style>
        .panel-heading {
        padding: 0;
    }
    .panel-heading ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    .panel-heading li {
        float: left;
        border-right:1px solid #bbb;
        display: block;
        padding: 14px 16px;
        text-align: center;
    }
    .panel-heading li:last-child:hover {
        background-color: #ccc;
    }
    .panel-heading li:last-child {
        border-right: none;
    }
    .panel-heading li a:hover {
        text-decoration: none;
    }

    .table.table-bordered tbody td {
        vertical-align: baseline;
    }
    </style>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width, initial-scale=1" name="viewport">
            <meta content="" name="description">
                <meta content="" name="author">
                    <!-- Favicon -->
                    <link href="{{ asset('images/favicon.jpg') }}" rel="shortcut icon"/>
                    <!-- CSFR token for ajax call -->
                    <meta content="{{ csrf_token() }}" name="_token"/>
                    <!-- Bootstrap CSS -->
                    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
                    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet"/>
                    <script>
                    </script>
                    @section('content')
                    <section class="col-lg-12 connectedSortable">
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-descripcion">
                                    Reportes Especies de los arboles
                                </h3>
                                <div class="col-md-6">
                                    <br>
                                        <form action="{{ action('ReportesController@ArbolesConteoPDF') }}" class="form-horizontal" id="formmass" method="post" role="form">
                                            <input name="_token" type="hidden" value="<?php echo csrf_token(); ?>">
                                                <br>
                                                    <div class="form-group" id="nombre">
                                                        <label class="control-label col-sm-2" for="descripcion">
                                                            Lista de Especies de arboles:
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <select class="form-control multiple-select" id="multiples" multiple="multiple" name="ArbolesEspecies[]">
                                                                @foreach($ArbolesEspecies as $lists)
                                                                <option value="{{$lists->id}}">
                                                                    {{$lists->nombre}}
                                                                </option>
                                                                @endforeach
                                                            </select>
                                                            <p class="errornombre text-center alert alert-danger hidden">
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-warning" data-dismiss="modal" type="submit">
                                                            <span class="glyphicon glyphicon-remove">
                                                            </span>
                                                            Imprimir reportes
                                                        </button>
                                                    </div>
                                                </br>
                                            </input>
                                        </form>
                                    </br>
                                </div>
                            </div>
                        </div>
                    </section>
                    @endsection
                                        @section("page-js-files")
                    <script crossorigin="anonymous" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" src="https://code.jquery.com/jquery-2.2.4.js">
                    </script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" type="text/javascript">
                    </script>
                    @stop   
                    @section("page-js-script")
                    @stop
                </meta>
            </meta>
        </meta>
    </meta>
</meta>
