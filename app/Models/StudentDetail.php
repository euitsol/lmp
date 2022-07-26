<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentDetail extends Model
{
    use HasFactory;

    public function center(){
        return $this->belongsTo(Center::class, 'center_id', 'id');
    }

    public function birth_country_details(){
        return $this->belongsTo(Country::class, 'birth_country', 'id');
    }

    public function awarding_country_details(){
        return $this->belongsTo(Country::class, 'edu_awarding_country', 'id');
    }

    public function edu_level_details(){
        return $this->belongsTo(EduLevel::class, 'edu_level', 'id');
    }

    public function eng_test_details(){
        return $this->belongsTo(EnglishTest::class, 'edu_eng_test', 'id');
    }
}
