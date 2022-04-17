<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::orderBy('id','desc')->get();
        return $users;
    }
    
    public function login(Request $request)
    {
        $users = User::where('password', md5($request->password))
                ->where('email',$request->email)
                ->orderBy('id','desc')->first();
        return $users;
    }
    public function verify($email)
    {
        
        if (User::where('email', '=', $email)->exists()) {
            $users=null;
        }else{
            $users = User::where('email', '=', $email)->get();
        }
        return $users;
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
    
    public function store_imagen($id,Request $request)
    {
        $user = User::find($id);
        
        $url_imagen = $request->file('file0');        
        if($url_imagen){
            $url_imagen_name_generado= date("Ymd").time().'1.'.$url_imagen->getClientOriginalExtension();
            $url_imagen_name_original= $url_imagen->getClientOriginalName();
            //public_path()->put($url_imagen_name_generado, File::get($url_imagen));
            $destination = public_path() . '/image/' . $url_imagen_name_generado;
            $location = $_FILES["file0"]["tmp_name"];
            move_uploaded_file($location, $destination);
            $user->imagen = $url_imagen_name_generado;
            
        } 
        
        $user->update();
        return $user;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * name, email , email_verified_at, password, remember_token, created_at, updated_at
     */
    public function store(Request $request)
    {
        $user = new User();
        $user->name = $request->name!==null ? $request->name: '';
        $user->email = $request->email!==null ? $request->email: '';
        $user->password = $request->password!==null ? md5($request->password): '';
        $user->remember_token = $request->name!==null ? md5($request->name): '';
        
        $user->save();
        return $user;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
    public function update(Request $request)
    {
        $user = User::find($request->id);
        $user->name = $request->name!==null ? $request->name: '';
        $user->email = $request->email!==null ? $request->email: '';
        $user->password = $request->password!==null ? $request->password: '';
        $user->remember_token = $request->remember_token!==null ? $request->remember_token: '';
        $user->update();
        
        return $user;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id!==null ? $request->id: '';
        $user = User::find($id);
        //Storage::disk('producto')->delete($nivel->url_imagen_generado);
        $user->delete();
    }
}
