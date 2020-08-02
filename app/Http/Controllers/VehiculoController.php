<?php

namespace App\Http\Controllers;

use App\User;
use App\Vehiculo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VehiculoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Vehiculo::all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //insertar en la base de datos
        $result = Array(
            "status"=>0
        );

        try{
            $vehiculo = new Vehiculo();
            $vehiculo->marca = $request->get("marca");
            $vehiculo->modelo = $request->get("modelo");
            $vehiculo->anio = $request->get("anio");
            $vehiculo->placa = $request->get("placa");
            $vehiculo->unidad_id = $request->get("unidad_id");
            $vehiculo->usuario_id = $request->get("usuario_id");

            $vehiculo->save();
            $result["status"] = 1;
            $result["message"] = "Vehiculo guardado correctamente";

        }catch(\Exception $e){
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Vehiculo::find($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //insertar en la base de datos
        $result = Array(
            "status"=>0
        );

        try{
            $vehiculo = Vehiculo::find($id);
            $vehiculo->marca = $request->get("marca");
            $vehiculo->modelo = $request->get("modelo");
            $vehiculo->anio = $request->get("anio");
            $vehiculo->placa = $request->get("placa");
            $vehiculo->unidad_id = $request->get("unidad_id");
            $vehiculo->usuario_id = $request->get("usuario_id");

            $vehiculo->save();
            $result["status"] = 1;
            $result["message"] = "Vehiculo actualizado correctamente";

        }catch(\Exception $e){
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $result = Array(
            "status"=>0
        );

        try{
            $unidad = Vehiculo::find($id);

            $unidad->delete();
            $result["status"] = 1;
            $result["message"] = "Vehiculo eliminado correctamente";

        }catch(\Exception $e){
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }

    public function vehiculos(Request $request){
        $usuario_id = $request->get("usuario_id");
        $usuario = User::find($usuario_id);

        $vehiculos = Vehiculo::select("vehiculo.id","vehiculo.marca",DB::raw('CONCAT(vehiculo.placa, " - ", C.nombre) AS placa'))
            ->join('usuario as C','vehiculo.usuario_id','=','C.id')
            ->where("vehiculo.unidad_id",$usuario->unidad_id)->get();

        return response()->json($vehiculos);
    }
}
