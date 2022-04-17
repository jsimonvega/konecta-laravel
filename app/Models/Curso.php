<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    use HasFactory;
    protected $fillable = ['nombre', 'resumen', 'imagen', 'autor'];
    
    public function promedio()
    {        
        return $this->hasOne(Promedio::class, 'id_curso', 'id');
    }
}
