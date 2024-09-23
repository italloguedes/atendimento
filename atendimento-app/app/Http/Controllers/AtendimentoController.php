<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Atendimento;

class AtendimentoController extends Controller
{
    // Exibe o formulário de cadastro
    public function create()
    {
        return view('cadastrar'); // Crie uma view cadastrar.blade.php
    }

    // Armazena os dados do atendimento no banco de dados
    public function store(Request $request)
    {
        // Valida os campos de entrada
        $request->validate([
            'nome' => 'required|string|max:255',
            'cpf' => 'required|string|max:14|unique:atendimentos',
            'solicitante' => 'required|string|max:255',
        ]);

        // Criação do atendimento
        Atendimento::create([
            'nome' => $request->nome,
            'cpf' => $request->cpf,
            'dia_atual' => now()->toDateString(),
            'horario' => now()->toTimeString(),
            'solicitante' => $request->solicitante,
        ]);

        // Redireciona de volta para o formulário com mensagem de sucesso
        return redirect('/cadastrar')->with('success', 'Atendimento cadastrado com sucesso!');
    }
}
