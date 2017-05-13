@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Estatísticas de compromissos</h4>
                        <p class="category">Desempenho</p>
                    </div>
                    <div class="content">
                        <div id="chartPreferences" data-totalagenda="{{$total_agenda}}" class="ct-chart ct-perfect-fourth"></div>

                        <div class="footer">
                            <div class="legend">
                                <i class="fa fa-circle text-info" id="completed" data-completed="{{$completed}}"></i> Concluído
                                <i class="fa fa-circle text-danger" id="late" data-late="{{$late}}"></i> Atrasados
                                <i class="fa fa-circle text-warning" id="notcomplete" data-notcomplete="{{$not_complete}}"></i> A concluir
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-clock-o"></i> Resultado dos ultimos
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        var completed = $('#completed').data("completed");
        var late = $('#late').data("late");
        var notcomplete = $('#notcomplete').data("notcomplete");
        var total_agenda = $('#chartPreferences').data("totalagenda");
    </script>
@endsection
