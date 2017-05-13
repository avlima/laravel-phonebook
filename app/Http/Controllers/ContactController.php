<?php

namespace App\Http\Controllers;

use App\Contracts\ContactInterface;
use App\Http\Requests\ContactRequest;
use App\Models\Contact;
use App\Utils\HelperUtils;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    /**
     * @var ContactInterface
     */
    private $contact;

    /**
     * ContactController constructor.
     * @param ContactInterface $contact
     */
    public function __construct(ContactInterface $contact)
    {
        $this->contact = $contact;
    }

    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        /*Essa rota responde a aplicação web e chamadas api, por isso exige essa verificação*/
        if (HelperUtils::requestApi($request)) {
            return response()->json($this->contact->getAll());
        } else {
            return view('contact.index', ['contacts' => $this->contact->getAll()]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('contact.create', ['contact' => new Contact()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param ContactRequest|Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(ContactRequest $request)
    {
        if ($contact = $this->contact->create($request->all())) {

            /*Essa rota responde a aplicação web e chamadas api, por isso exige essa verificação*/
            if (HelperUtils::requestApi($request)) {
                return response()->json($contact);
            } else {
                return redirect('contacts');

            }
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
        return response()->json($this->contact->getById($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        return view('contact.edit', ['contact' => $this->contact->getById($id)]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ContactRequest|Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(ContactRequest $request, $id)
    {
        if ($contact = $this->contact->update($request->all(), $id)) {

            /*Essa rota responde a aplicação web e chamadas api, por isso exige essa verificação*/
            if (HelperUtils::requestApi($request)) {
                return response()->json($contact);
            } else {
                return redirect('contacts');

            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        if ($this->contact->delete($id)) {

            /*Essa rota responde a aplicação web e chamadas api, por isso exige essa verificação*/
            if (HelperUtils::requestApi($request)) {
                return response()->json(true);
            } else {
                return redirect('contacts');
            }
        }
    }
}
