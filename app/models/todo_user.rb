class TodoUser < ApplicationRecord
  # パスワードのハッシュ化
  has_secure_password

  #バリデーション
  validates :name, presence: true
  validates :email presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  
  has_many :todo_tasks, dependent: :destroy
end


```ruby
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class TodoUser extends Authenticatable
{
    use HasFactory;

    /**
     * has_secure_password 相当
     * パスワードを自動でハッシュ化
     */
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }

    /**
     * has_many :todo_tasks, dependent: :destroy 相当
     */
    public function todoTasks()
    {
        return $this->hasMany(TodoTask::class);
    }
}
```