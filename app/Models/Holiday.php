<?php

namespace App\Models;

use App\Models\User;
use App\Models\Calendar;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Holiday extends Model
{
    //


    use HasFactory;

    protected $fillable = [
        'calendar_id',
        'user_id',
        'type',
        'day',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public function calendar()
    {
        return $this->belongsTo(Calendar::class);
    }


}
