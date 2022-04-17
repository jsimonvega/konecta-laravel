<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Califica_curso extends Model
{
    use HasFactory;
    protected $fillable = ['calificacions_id','cursos_id'];
}
