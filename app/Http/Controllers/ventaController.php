<?php 
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use App\Estado_ventaModel;
use App\VentaModel;
use View;

use App\HasRoles;
use App\Roles;
use App\User;

use DB;
use PDF;

use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class VentaController extends Controller
{
	public function __construct(){
		$this->middleware('auth');
	}
	   
	protected $rules =
	[
		
				//'id' => 'required|min:1|max:99999999',
	   			'fecha_venta' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'users_id' => 'required|min:1|max:99999999',
	   			'estado_venta_id' => 'required|min:1|max:99999999',
	   			
	];

	public function index(){

		//$id_tipo = Solicitude_tipo::select("solicitude_tipos.id","solicitude_tipos.descripcion as nombre")->get();

		$Venta = VentaModel::all();

		$users_id = User::select("id","name as nombre")->get();
		$estado_venta_id = Estado_ventaModel::select("id","nombre")->get();
		   	
		return view('Venta.index', [ "users_id" => $users_id,"estado_venta_id" => $estado_venta_id, 'listmysql' => $Venta] );

	}

	public function create(){}

	public function store(Request $request){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Venta = new VentaModel();
			
			$Venta->fecha_venta=$request->fecha_venta;
			$Venta->users_id=$request->users_id;
			$Venta->estado_venta_id=$request->estado_venta_id;
			$Venta->created_at=$request->created_at;
			$Venta->updated_at=$request->updated_at;
				
			$Venta->save();
			return response()->json($Venta);
		}
	}

	public function show($id){}

	public function edit($id){}

	public function update(Request $request, $id){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Venta = VentaModel::findOrFail($id);
			
			 $Venta->fecha_venta=$request->fecha_venta;
				 $Venta->users_id=$request->users_id;
				 $Venta->estado_venta_id=$request->estado_venta_id;
				 $Venta->created_at=$request->created_at;
				 $Venta->updated_at=$request->updated_at;
				
		  
			$Venta->save();
			return response()->json($Venta);
		}
	}

	public function destroy($id){
		$Venta = VentaModel::findOrFail($id);
		$Venta->delete();
		return response()->json($Venta);
	}
	public function PDF($venta_id){
		$venta=VentaModel::where('id',$venta_id)
        ->with('users_id_pk','productos_has_venta_all.producto_id_pk')
		->where('estado_venta_id',4)->first();



		PDF::SetTitle('Resumer de barrios');

        PDF::SetFont('times', 'BI', 20);
        //$txt = "Auditoria de SamanGir: $fecha_inicial A $fecha_final ";
        PDF::SetCreator(PDF_CREATOR);
        //PDF::SetAuthor('Nicola Asuni');
        PDF::SetTitle('TCPDF Example 029');
        PDF::SetSubject('TCPDF Tutorial');
        PDF::SetKeywords('TCPDF, PDF, example, test, guide');
        // set default header data

        PDF::SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 029', PDF_HEADER_STRING);
        //PDF::Header('/img/logo.png', 100, 'string to print as title on document header', 'string to print on document header');

        PDF::SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        PDF::SetHeaderMargin(PDF_MARGIN_HEADER);
        PDF::SetFooterMargin(PDF_MARGIN_FOOTER);

        PDF::SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);
        //PDF::setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
        //PDF::setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
        PDF::AddPage();
        PDF::SetAutoPageBreak(true, 20);
        PDF::SetFont('helvetica', 'BI', 14); //tipo de textos y tamaño

        PDF::Image('imagenes/descarga.png', '', '', 20, 20, '', '', '', false, 300, '', false, false, 0, false, false, false);
        PDF::Write(0, 'FACTURA', '', 0, 'C', true, 0, false, false, 0);
        PDF::SetFont('helvetica', 'BI', 14); //tipo de textos y tamaño		
		PDF::Write(0, 'Rojo Polo Paella S.A. ', '', 0, 'C', true, 0, false, false, 0);
		PDF::Write(0, 'Carrera 34 calle 23-34. ', '', 0, 'C', true, 0, false, false, 0);

        PDF::setCellPaddings(1, 1, 1, 1);

        PDF::SetFont('helvetica', 'BI', 10); //tipo de textos y tamaño
        PDF::Ln();
        PDF::Ln();
        //PDF::Write(0, $txt, '', 0, 'C', true, 0, false, false, 0);
        PDF::Write(0, 'FACTURAR A', '', 0, 'L', true, 0, false, false, 0);
        PDF::Write(0, $venta->users_id_pk->name, '', 0, 'L', true, 0, false, false, 0);
        PDF::Write(0, 'N° DE  FACTURA', '', 0, 'L', true, 0, false, false, 0);
		PDF::Write(0, $venta->id, '', 0, 'L', true, 0, false, false, 0);
		PDF::Write(0, 'Fecha de la venta', '', 0, 'L', true, 0, false, false, 0);
        PDF::Write(0, $venta->fecha_venta, '', 0, 'L', true, 0, false, false, 0);
        //PDF::Write(0, 'Fuente: Calculo de numeros de arboles basado en los diferentes barrios que tiene el municipio ', '', 0, 'L', true, 0, false, false, 0);
        PDF::Ln();
        PDF::SetFillColor(255, 255, 255);
	   
		PDF::MultiCell(30, 8, ' Codigo: ', 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
		PDF::MultiCell(50, 8, ' Nombre ', 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
		PDF::MultiCell(30, 8, ' Precio ', 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
		PDF::MultiCell(30, 8, ' Cantidad', 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
		PDF::MultiCell(30, 8, ' Total ', 1, 'L', 0, 1, '', '', true, 0, false, true, 10, 'T');
		$total=0;
		foreach ($venta->productos_has_venta_all as $row) {
            //$conteo = ArbolesModel::Where('barrio_id', $row->barrio_id)->get()->Count();
            PDF::SetFont('helvetica', 'BI', 12); //tipo de textos y tamaño
            PDF::MultiCell(30, 8, '' . $row->producto_id_pk->codigo_producto, 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
            PDF::MultiCell(50, 8, '' . $row->producto_id_pk->nombre, 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
            PDF::MultiCell(30, 8, '' . number_format($row->precio_producto), 1, 'R', 1, 0, '', '', true, 0, false, true, 10, 'T');
            PDF::MultiCell(30, 8, '' . $row->cantidad, 1, 'R', 1, 0, '', '', true, 0, false, true, 10, 'T');
            PDF::MultiCell(30, 8, '' . number_format($row->precio_producto*$row->cantidad), 1, 'R', 0, 1, '', '', true, 0, false, true, 10, 'T');
			$total=$total+$row->precio_producto*$row->cantidad;
		}
		PDF::MultiCell(110, 8, ' ', 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
		PDF::MultiCell(30, 8, ' Total', 1, 'L', 1, 0, '', '', true, 0, false, true, 10, 'T');
		PDF::MultiCell(30, 8, '$'.number_format($total), 1, 'R', 0, 1, '', '', true, 0, false, true, 10, 'T');


        PDF::SetFont('helvetica', 'BI', 10); //tipo de textos y tamaño
       
        PDF::Ln();
        PDF::SetFont('helvetica', '', 8); //tipo de textos y tamaño
        PDF::SetFillColor(255, 255, 255);
        PDF::SetCreator(PDF_CREATOR);
		PDF::setCellPaddings(0.5, 0.5, 0.5, 0.5);
		





		PDF::Ln();
        PDF::Output('ArbolesBarrios_pdf.pdf');
        PDF::Cell(array_sum($w), 0, '', 'T');


	}
	

}


