<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(User::where("rol_id", 3)->get());
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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //insertar en la base de datos
        $result = Array(
            "status" => 0
        );

        try {
            $usuario = new User();
            $usuario->nombre = $request->get("nombre");
            $usuario->email = $request->get("email");
            $usuario->unidad_id = $request->get("unidad_id");
            $usuario->rol_id = 3;
            $usuario->password = bcrypt($request->get("password"));

            $usuario->save();
            $result["status"] = 1;
            $result["message"] = "Usuario guardado correctamente";

        } catch (\Exception $e) {
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        $result = null;
        switch ($user->rol_id) {
            case 2://conductor
                $result = response()->json(User::with("vehiculo")->find($id));
                break;
            case 3://autoridad
                $result = response()->json(User::with("unidad")->find($id));
                break;
        }
        return $result;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //insertar en la base de datos
        $result = Array(
            "status" => 0
        );

        try {
            $usuario =  User::find($id);
            $usuario->nombre = $request->get("nombre");
            $usuario->email = $request->get("email");
            $usuario->unidad_id = $request->get("unidad_id");
            $usuario->rol_id = 3;
            $usuario->password = bcrypt($request->get("password"));

            $usuario->save();
            $result["status"] = 1;
            $result["message"] = "Usuario actualizado correctamente";

        } catch (\Exception $e) {
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $result = Array(
            "status"=>0
        );

        try{
            $unidad = User::find($id);

            $unidad->delete();
            $result["status"] = 1;
            $result["message"] = "Usuario eliminado correctamente";

        }catch(\Exception $e){
            $result["status"] = 0;
            $result["message"] = $e->getMessage();
        }

        return response()->json(compact("result"));
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $token = null;

        try {
            if (!$token = \JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'Credenciales no validas']);
            }
        } catch (JWTException $ex) {
            return response()->json(['error' => 'Ups, algo fue mal'], 500);
        }
        $user = \JWTAuth::toUser($token);
        $user = User::find($user->id);
        $response = [
            "error" => "",
            "idUsuario" => $user->id,
            "token" => $token,
            "displayName" => $user->nombre,
            "rol" => $user->rol_id
        ];
        return response()->json($response);
    }
}
