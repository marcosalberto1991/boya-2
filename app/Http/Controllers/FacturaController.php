<?php 
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\FacturaModel;
use View;
use App\EstadoModel;
use App\HasRoles;
use App\ProveedorModel;
use App\Roles;
use App\User;
use App\Model_has_rolesModel;


use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class FacturaController extends Controller
{
	public function __construct(){
		$this->middleware('auth');
	}
	   
	protected $rules =
	[
		
				//'id' => 'required|min:1|max:99999999',
	   			'numero_factura' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'fecha' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'estados_id' => 'required|min:1|max:99999999',
	   			'users_id' => 'required|min:1|max:99999999',
	   			
	];

	public function index(){

		$Factura = FacturaModel::all();
		$proveedor_id = ProveedorModel::select("id","nombre")->get();
		
		if(Model_has_rolesModel::where('model_id',auth()->user()->id )->where('role_id',3)->first()){
			$estados_id = EstadoModel::select("id","nombre")->get();
			$users_id = User::select("id","name as nombre")->get();
			$proveedor_id = ProveedorModel::select("id","nombre")->get();
		}else{
			$estados_id=EstadoModel::select("id","nombre")->where('id',1)->get();
			$user_id=User::select("id","name as nombre")->where('id',auth()->user()->id )->get();
		}   	
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
			$Factura->estados_id=$request->estados_id;
			$Factura->users_id=$request->users_id;
			$Factura->updated_at=$request->updated_at;
			$Factura->created_at=$request->created_at;
				
			$Factura->save();
			return response()->json($Factura);
		}
	}

	public function show($id){}

	public function edit($id){}

	public function update(Request $request, $id){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Factura = FacturaModel::findOrFail($id);
			$Factura->numero_factura=$request->numero_factura;
			$Factura->fecha=$request->fecha;
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


