<?php

namespace App\Http\Controllers;

use App\Contracts\AgendaInterface;
use App\Contracts\ContactInterface;
use App\Http\Requests\AgendaRequest;
use App\Models\Agenda;
use Illuminate\Http\Request;

class AgendaController extends Controller
{
    /**
     * @var AgendaInterface
     */
    private $agenda;
    /**
     * @var ContactInterface
     */
    private $contact;

    /**
     * AgendaController constructor.
     * @param AgendaInterface $agenda
     * @param ContactInterface $contact
     */
    public function __construct(AgendaInterface $agenda, ContactInterface $contact)
    {
        $this->agenda = $agenda;
        $this->contact = $contact;
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('agenda.index', ['agendas' => $this->agenda->getAll()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('agenda.create', ['agenda' => new Agenda(), 'contacts' => $this->contact->getAll()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param AgendaRequest|Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(AgendaRequest $request)
    {
        if ($this->agenda->create($request->all())) {
            return redirect('agendas');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('agenda.edit', ['agenda' => $this->agenda->getById($id), 'contacts' => $this->contact->getAll()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param AgendaRequest|Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(AgendaRequest $request, $id)
    {
        if ($this->agenda->update($request->all(), $id)) {
            return redirect('agendas');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if ($this->agenda->delete($id)) {
            return redirect('agendas');
        }
    }
}
