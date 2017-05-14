<?php

namespace App\Http\Requests;

use App\Utils\HelperUtils;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class ContactRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string|min:2|max:191',
            'phone' => 'required|string|min:10',
            'email' => 'required|string|min:10',
        ];
    }

    /**
     * @return array
     */
    public function messages()
    {
        return [
            'min' => ':attribute deve ter no mínimo :min caracteres.',
            'max' => ':attribute não deve ter mais que :max caracteres.',
            'required' => 'O campo :attribute é obrigatório.',
            'unique' => ':attribute já está em uso.',
            'email' => ':attribute deve ser um endereço de e-mail válido.',
            'string' => ':attribute deve ser uma string',
        ];
    }

    /**
     * @return array
     */
    public function attributes()
    {
        return [
            'name' => 'Nome',
            'phone' => 'Telefone',
            'email' => 'E-mail',
        ];
    }
}
