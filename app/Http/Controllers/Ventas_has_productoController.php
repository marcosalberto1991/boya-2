<?php
namespace App\Http\Controllers;
use App\Ventas_has_productoModel;
use App\VentasModel;
use Illuminate\Http\Request;

class Ventas_has_productoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $ventas=Ventas_has_productoModel::with('ventas_id_pk.mesa_id_pk')->get();
        foreach ($ventas as $key => $value) {
            $ventas->$key->total_mesa="mañana";
        }
        return $ventas;
    }
    public function store(Request $request)
    {
        $thought = new Ventas_has_productoModel();
        $thought->producto_id = $request->producto_id;
        $thought->ventas_id = $request->ventas_id;
        $thought->cantidad = $request->cantidad;
        //$thought->user_id = auth()->id();
        $thought->save();
        $thought=VentasModel::with('mesa_id_pk','ventas_has_producto_all.producto_id_pk')->get();
        return $thought;
    }
    public function update(Request $request, $id)
    {
        $thought = Ventas_has_productoModel::find($id);
        $thought->producto_id = $request->producto_id;
        $thought->ventas_id = $request->ventas_id;
        $thought->cantidad = $request->cantidad;
        $thought->save();
        return $thought;
    }
    public function destroy(Request $request,$id)
    {
        $thought = Ventas_has_productoModel::find($id);
        $thought->delete();
        return $thought;
    }
}