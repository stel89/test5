@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    You are logged in!
                    <h4>Your name is {{Auth::user()->name}}</h4>
                    <img src ="{{Auth::user()->avatar}}" height:200px width:200px>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
