<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\punto;
use App\Http\Resources\punto as puntoResource;
class puntoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function vista()
    {
        return view('punto.vista', [  
			
			] );

    }
    public function index()
    {
        // Get puntos
        $puntos = punto::orderBy('created_at', 'desc')->paginate(3);
        // Return collection of puntos as a resource
        return puntoResource::collection($puntos);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $punto = $request->isMethod('put') ? punto::findOrFail($request->punto_id) : new punto;
        $punto->id = $request->input('punto_id');
        $punto->title = $request->input('title');
        $punto->body = $request->input('body');
        if($punto->save()) {
            return new puntoResource($punto);
        }
        
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Get punto
        $punto = punto::findOrFail($id);
        // Return single punto as a resource
        return new puntoResource($punto);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Get punto
        $punto = punto::findOrFail($id);
        if($punto->delete()) {
            return new puntoResource($punto);
        }    
    }
}