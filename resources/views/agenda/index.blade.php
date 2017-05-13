@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">Agenda</div>
                    <div class="panel-body">
                        Meus compromissos.
                        <a href="{{ route('agendas.create') }}" class="btn btn-sm btn-success pull-right">
                            <i class="material-icons">note_add</i>
                        </a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Data</th>
                                <th>Contato</th>
                                <th>Descrição</th>
                                <th>Concluído</th>
                                <th class="text-center">Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($agendas as $agenda)
                                <tr>
                                    <th scope="row">{{$agenda->id}}</th>
                                    <td>{{ Carbon\Carbon::parse($agenda->date)->format('d/m/Y') }}</td>
                                    <td>{{$agenda->contact->name}}</td>
                                    <td>{{ str_limit($agenda->description, $limit = 20, $end = '...') }}</td>
                                    <td>{{$agenda->completed}}</td>
                                    <td class="text-center">
                                        <span>
                                            <a href="{{ route('agendas.edit', ['id' => $agenda->id]) }}">
                                                <i class="material-icons">edit</i>
                                            </a>
                                        </span>
                                        <span>
                                           <a data-toggle="modal" data-route="agendas" data-id="{{$agenda->id}}" href="#deleteModal"
                                              class="deleteModal">
                                            <i class="material-icons text-danger">delete</i>
                                            </a>
                                        </span>
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

    @include('delete-modal')
@endsection
