class TodoPriority < ApplicationRecord
  #バリデーション
  validates :name, presence: true, uniqueness: true
  validates :label, presence: true

  #リレーション
  has_many :todo_tasks, dependent: :destroy

  # ソート順で並び替え
  scope :ordered, -> { order(:sort_order) }
end
```ruby
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TodoPriority extends Model
{
    // バリデーション
    // validates :name, presence: true, uniqueness: true
    // validates :label, presence: true

    // リレーション
    public function todoTasks()
    {
        return $this->hasMany(TodoTask::class);
    }

    // ソート順で並び替え
    public function scopeOrdered($query)
    {
        return $query->orderBy('sort_order');
    }
}
```