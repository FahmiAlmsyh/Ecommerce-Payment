<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class carts extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'product_id',
        'qty'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function product()
{
    return $this->belongsTo(Products::class, 'product_id', 'id');
}

}
