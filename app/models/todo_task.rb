class TodoTask < ApplicationRecord
 #バリデーション
 validates :title, presence: true
 validates :todo_user_id, presence: true
 validates :todo_status_id,presence: true
 validates :todo_priority_id, presence: true

 #リレーション
 belongs_to :todo_user
 belongs_to :todo_status
 belongs_to :todo_priority

 #スコープ
 scope :recent, -> { order(created_at: :desc) }
 scope :by_user, ->(user_id) { where(todo_user_id: user_id) }
end


```ruby
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TodoTask extends Model
{
    // バリデーション（Railsではここに書くが、Laravelでは別レイヤー）
    // validates :title, presence: true
    // validates :todo_user_id, presence: true
    // validates :todo_status_id, presence: true
    // validates :todo_priority_id, presence: true

    // リレーション
    public function todoUser()
    {
        return $this->belongsTo(TodoUser::class);
    }

    public function todoStatus()
    {
        return $this->belongsTo(TodoStatus::class);
    }

    public function todoPriority()
    {
        return $this->belongsTo(TodoPriority::class);
    }

    // スコープ
    public function scopeRecent($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function scopeByUser($query, $userId)
    {
        return $query->where('todo_user_id', $userId);
    }
}
