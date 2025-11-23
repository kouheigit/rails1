class TodoUser < ApplicationRecord


end



```ruby
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable; // 認証ユーザーとして使う
use Illuminate\Notifications\Notifiable;

class TodoUser extends Authenticatable
{
    use HasFactory, Notifiable;

    // 保存を許可するカラム
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    // パスワードは自動でハッシュ化
    protected $hidden = [
        'password',
        'remember_token',
    ];

    // 型キャストなど（必要なら）
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * リレーション: 1人のユーザーは複数の TodoTask を持つ
     */
    public function todoTasks()
    {
        return $this->hasMany(TodoTask::class);
    }
}
```