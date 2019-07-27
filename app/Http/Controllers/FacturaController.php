<?php 
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\FacturaModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class FacturaController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}
	   
	protected $rules =
	[
		'id' => 'required|min:1|max:99999999',
	   			'numero_factura' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'fecha' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'proveedor_id' => 'required|min:1|max:99999999',
	   			'estados_id' => 'required|min:1|max:99999999',
	   			'users_id' => 'required|min:1|max:99999999',
	   			
	];

	public function index(){

		//$id_tipo = Solicitude_tipo::select("solicitude_tipos.id","solicitude_tipos.descripcion as nombre")->get();

		$Factura = FacturaModel::all();

		$estados_id = FacturaModel::select("id","id as nombre")->get();
		   	$users_id = FacturaModel::select("id","id as nombre")->get();
		   	
		return view('Factura.index', [ "estados_id" => $estados_id,"users_id" => $users_id, 'listmysql' => $Factura] );

	}

	public function create(){}

	public function store(Request $request){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Factura = new FacturaModel();
			
			 $Factura->numero_factura=$request->numero_factura;
				 $Factura->fecha=$request->fecha;
				 $Factura->proveedor_id=$request->proveedor_id;
				 $Factura->estados_id=$request->estados_id;
				 $Factura->users_id=$request->users_id;
				 $Factura->updated_at=$request->updated_at;
				 $Factura->created_at=$request->created_at;
				
			$Factura->save();
			return response()->json($Factura);
		}
	}

    public function show($id){
        return response()->json(FacturaModel::findOrFail($id));
    }
    public function consulta(){
        return response()->json(FacturaModel::paginate(5));
    }

	public function edit($id){}

	public function update(Request $request, $id){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Factura = FacturaModel::findOrFail($id);
			
			 $Factura->numero_factura=$request->numero_factura;
				 $Factura->fecha=$request->fecha;
				 $Factura->proveedor_id=$request->proveedor_id;
				 $Factura->estados_id=$request->estados_id;
				 $Factura->users_id=$request->users_id;
				 $Factura->updated_at=$request->updated_at;
				 $Factura->created_at=$request->created_at;
				
		  
			$Factura->save();
			return response()->json($Factura);
		}
	}

	public function destroy($id){
		$Factura = FacturaModel::findOrFail($id);
		$Factura->delete();
		return response()->json($Factura);
	}

}


