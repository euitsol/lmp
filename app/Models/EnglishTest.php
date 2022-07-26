<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class EnglishTest extends Model
{
    use HasFactory;

    public function save(array $options = [])
    {
        if (!$this->created_by && auth()->user()) {
            $this->created_by = auth()->user()->id;
        }
        if (!$this->status) {
            $this->status = 'Active';
        }

        parent::save();
    }
}
