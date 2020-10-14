<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\categorias;
class CategoriasController extends Controller
{   
    public function vista(){
        return view('registro');
    }
    public function create(Request $request){
        $categorias = new categorias();

        $categorias -> Nombre = $request -> Nombre;
        $categorias -> NitEmpresa = $request -> NitEmpresa;
        $categorias -> save();

        return redirect('/create');

    }
}
