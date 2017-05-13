<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AgendaRequest extends FormRequest
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
            'contact_id' => 'required',
            'description' => 'required|string|min:10',
            'date' => 'required|date_format:"d/m/Y',
        ];
    }

    /**
     * @return array
     */
    public function messages()
    {
        return [
            'min' => ':attribute deve ter no mínimo :min caracteres.',
            'required' => 'O campo :attribute é obrigatório.',
            'string' => ':attribute deve ser uma string',
            'date_format' => ':attribute não confere com o formato :format.',
        ];
    }

    /**
     * @return array
     */
    public function attributes()
    {
        return [
            'contact_id' => 'Contato',
            'description' => 'Descrição',
            'date' => 'Data',
            'completed' => 'Concluído',
        ];
    }
}
