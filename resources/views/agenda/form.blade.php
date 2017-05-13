{{ csrf_field() }}

<div class="form-group{{ $errors->has('date') ? ' has-error' : '' }}">
    <label for="date" class="col-md-4 control-label">Data</label>

    <div class="col-md-6">
        <input id="date" type="text" class="form-control date" name="date"
               value="{{ $agenda->date ? Carbon\Carbon::parse($agenda->date)->format('d/m/Y') : "" }}" required
               autofocus>

        @if ($errors->has('date'))
            <span class="help-block">
                <strong>{{ $errors->first('date') }}</strong>
            </span>
        @endif
    </div>
</div>

<div class="form-group{{ $errors->has('contact_id') ? ' has-error' : '' }}">
    <label for="contact" class="col-md-4 control-label">Contato</label>

    <div class="col-md-6">
        <select class="form-control" name="contact_id" required>
            <option value="">Selecione</option>
            @foreach ($contacts as $contact)
                <option {{$agenda->contact_id == $contact->id ? 'selected' : ''}} value="{{ $contact->id or "" }}">{{ $contact->name or "" }}</option>
            @endforeach
        </select>

        @if ($errors->has('contact_id'))
            <span class="help-block">
                <strong>{{ $errors->first('contact_id') }}</strong>
            </span>
        @endif
    </div>
</div>

<div class="form-group{{ $errors->has('description') ? ' has-error' : '' }}">
    <label for="description" class="col-md-4 control-label">E-Mail</label>

    <div class="col-md-6">
        <textarea class="form-control" rows="3" name="description" id="description"
                  required>{{ $agenda->description or "" }}</textarea>

        @if ($errors->has('description'))
            <span class="help-block">
                <strong>{{ $errors->first('description') }}</strong>
            </span>
        @endif
    </div>
</div>

@if ($agenda->id)
    <div class="form-group{{ $errors->has('completed') ? ' has-error' : '' }}">
        <label for="completed" class="col-md-4 control-label">Concluído</label>

        <div class="col-md-6">
            <select class="form-control" name="completed" required>
                <option {{$agenda->completed == 'Não' ? 'selected' : ''}} value="Não">Não</option>
                <option {{$agenda->completed == 'Sim' ? 'selected' : ''}} value="Sim">Sim</option>
            </select>

            @if ($errors->has('completed'))
                <span class="help-block">
                <strong>{{ $errors->first('completed') }}</strong>
            </span>
            @endif
        </div>
    </div>
@endif