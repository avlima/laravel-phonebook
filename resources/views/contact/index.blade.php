@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">Contatos</div>
                    <div class="panel-body row">
                        <div class="col-xs-12">
                            Minha lista de contatos.
                            <a href="{{ route('contacts.create') }}" class="btn btn-sm btn-success pull-right">
                                <i class="material-icons">person_add</i>
                            </a>
                        </div>
                        @if($errors->any())
                            <div class="col-xs-12 mt-10">
                                <div class="alert alert-danger" role="alert">
                                    {{$errors->first()}}
                                </div>
                            </div>
                        @endif
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>E-mail</th>
                                <th class="text-center">Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($contacts as $contact)
                                <tr>
                                    <th scope="row">{{$contact->id}}</th>
                                    <td>{{$contact->name}}</td>
                                    <td>{{$contact->phone}}</td>
                                    <td>{{$contact->email}}</td>
                                    <td class="text-center">
                                        <span>
                                            <a href="{{ route('contacts.edit', ['id' => $contact->id]) }}">
                                                <i class="material-icons">edit</i>
                                            </a>
                                        </span>
                                        <span>
                                            <a data-toggle="modal" data-route="contacts" data-id="{{$contact->id}}"
                                               href="#deleteModal"
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