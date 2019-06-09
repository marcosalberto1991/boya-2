<?php
namespace App\Http\Controllers;
use App\VentasModel;

use App\Ventas_has_productoModel;
use Illuminate\Http\Request;
class VentasController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $ventas=VentasModel::with('mesa_id_pk','ventas_has_producto_all.producto_id_pk')->get();

        foreach ($ventas as $key => $value) {
            $ventas[$key]['total_mesa']=Ventas_has_productoModel::where('ventas_id',$value->ventas_id)->get();
        }
        return $ventas; 
    }
    public function store(Request $request)
    {
        $thought = new VentasModel();
        $thought->description = $request->description;
        $thought->user_id = auth()->id();
        $thought->save();
        return $thought;
    }
    public function update(Request $request, $id)
    {
        $thought = VentasModel::find($id);
        $thought->description = $request->description;
        $thought->save();
        return $thought;
    }
    public function destroy($id)
    {
        $thought = VentasModel::find($id);
        $thought->delete();
    }
}