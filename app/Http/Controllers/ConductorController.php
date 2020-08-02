<?php

namespace App\Http\Controllers;

use App\Conductor;
use App\User;
use Illuminate\Http\Request;

class ConductorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(User::where("rol_id",2)->get());
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
            $usuario = new User();
            $usuario->nombre = $request->get("nombre");
            $usuario->email = $request->get("email");
            $usuario->rol_id = 2;
            $usuario->password = bcrypt($request->get("password"));

            $usuario->save();
            $result["status"] = 1;
            $result["message"] = "Conductor guardado correctamente";

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
        return response()->json(Conductor::find($id));

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
            $usuario = User::find($id);
            $usuario->nombre = $request->get("nombre");
            $usuario->email = $request->get("email");
            $usuario->password = bcrypt($request->get("password"));

            $usuario->save();
            $result["status"] = 1;
            $result["message"] = "Conductor actualizado correctamente";

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
            $unidad = Conductor::find($id);

            $unidad->delete();
            $result["status"] = 1;
            $result["message"] = "Conductor eliminado correctamente";

        }catch(\Exception $e){
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }
}
