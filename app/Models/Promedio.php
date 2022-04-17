<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promedio extends Model
{
    use HasFactory;
    protected $table = 'promedio_view';
    protected $fillable = ['calificacion'];
}
