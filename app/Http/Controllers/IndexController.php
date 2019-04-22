<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\DatosDispositivoModel;
use App\DispositivoModel;
use View;


use App\HasRoles;
use App\Roles;
use App\User;

use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;
class IndexController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        
        $datosdispositivo = DatosDispositivoModel::with('dispositivo_id_pk')
        ->groupBy("dispositivo_id")
        ->orderBy('dispositivo_id', 'DESC')
        ->get();
        $dispositivo=DispositivoModel::where('estado_id',1)->get()->toArray();
        $fecha_dispositivo = DatosDispositivoModel::select('created_at')->orderBy('created_at', 'DESC')
        ->limit(8)
        ->get()
        ->toArray();
        //echo('<pre>');var_dump($fecha_dispositivo);echo('</pre>');exit();
        foreach($dispositivo as $key => $data) {
            $dispositivo[$key]['datos_bolla']=DatosDispositivoModel::where('dispositivo_id',$data['id'])->orderBy('id', 'DESC')
        ->limit(8)
        ->get()->toArray();
        }       
        return view('Index.grafica', [
            'fecha_dispositivo' => $fecha_dispositivo,
            'datosdispositivo' => $datosdispositivo,
            'dispositivo' => $dispositivo,
        ]);
    }
}
