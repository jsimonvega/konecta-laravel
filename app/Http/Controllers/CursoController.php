<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Curso;

class CursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        //$cursos = Curso::orderBy('id','desc')->get();
        $cursos = Curso::select('cursos.id', 'cursos.nombre','cursos.resumen','cursos.imagen','cursos.autor','cursos.created_at','cursos.updated_at','promedio_view.calificacion')
                ->leftjoin('promedio_view', 'cursos.id', '=', 'promedio_view.id_curso')
                ->orderBy('cursos.id','desc')
                ->get();
        return $cursos;
    }
    
    public function curso($id)
    {
        $curso = Curso::find($id);
        return $curso;
    }
    
    public function buscar(Request $request)
    {
        $fecha_ini=$request->fechaini;
        $fecha_fin=$request->fechafin;
        $select="Select * from cursos c where 1";
        $where="";
        if($request->nombre!=''){
            $where.=" and c.nombre like '%".$request->nombre."%'";
        }
        
        if (!empty($fecha_ini) and empty($fecha_fin)) {        
            $where .= " AND  DATE(c.created_at) >= '$fecha_ini'";

        } elseif (empty($fecha_ini) and!empty($fecha_fin)) {

            $where .= " AND  DATE(c.created_at) <= '$fecha_fin'";
        } elseif (!empty($fecha_ini) and!empty($fecha_fin)) {

            $where .= " AND DATE(c.created_at) BETWEEN '$fecha_ini' AND '$fecha_fin'";
        } else {
            $where .= "";
        }
        
        $order=" order by c.id desc";
        $select_cursos_final=$select.$where.$order;
        $curso = DB::select($select_cursos_final);;
        return $curso;
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
        $curso = new Curso();
        $curso->nombre = $request->nombre!==null ? $request->nombre: '';
        $curso->resumen = $request->resumen!==null ? $request->resumen: '';
        $curso->imagen = $request->imagen!==null ? $request->imagen: '';
        $curso->autor = $request->autor!==null ? $request->autor: '';
        
        $curso->save();
        return $curso;
    }
    
    public function store_imagen($id,Request $request)
    {
        $curso = Curso::find($id);
        
        $url_imagen = $request->file('file0');        
        if($url_imagen){
            $url_imagen_name_generado= date("Ymd").time().'1.'.$url_imagen->getClientOriginalExtension();
            $url_imagen_name_original= $url_imagen->getClientOriginalName();
            //public_path()->put($url_imagen_name_generado, File::get($url_imagen));
            $destination = public_path() . '/image/' . $url_imagen_name_generado;
            $location = $_FILES["file0"]["tmp_name"];
            move_uploaded_file($location, $destination);
            $curso->imagen = $url_imagen_name_generado;
            
        } 
        
        $curso->update();
        return $curso;
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
        $curso = Curso::find($request->id);
        $curso->nombre = $request->nombre!==null ? $request->nombre: '';
        $curso->resumen = $request->resumen!==null ? $request->resumen: '';
        $curso->imagen = $request->imagen!==null ? $request->imagen: '';
        $curso->autor = $request->autor!==null ? $request->autor: '';
        $curso->update();
        
        return $curso;
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
        $curso = Curso::find($id);
        //Storage::disk('producto')->delete($nivel->url_imagen_generado);
        $curso->delete();
    }
}
