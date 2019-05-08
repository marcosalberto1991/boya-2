<?php
namespace App\Http\Controllers;
use App\Ventas_has_productoModel;
use Illuminate\Http\Request;
class Ventas_has_productoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        return Ventas_has_productoModel::with('ventas_id_pk.mesa_id_pk')->get();
    }
    public function store(Request $request)
    {
        $thought = new Ventas_has_productoModel();
        $thought->producto_id = $request->producto_id;
        $thought->ventas_id = $request->ventas_id;
        $thought->cantidad = $request->cantidad;
        //$thought->user_id = auth()->id();
        $thought->save();
        return $thought;
    }
    public function update(Request $request, $id)
    {
        $thought = Ventas_has_productoModel::find($id);
        $thought->description = $request->description;
        $thought->save();
        return $thought;
    }
    public function destroy($id)
    {
        $thought = Ventas_has_productoModel::find($id);
        $thought->delete();
    }
}