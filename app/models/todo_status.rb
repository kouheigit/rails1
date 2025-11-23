class TodoStatus < ApplicationRecord
 #バリデーション(バリデーションはRailsではModelに記述する)
 validates :name, presence: true, uniqueness: true
 validates :label,presence: true

 #リレーション(リレーション)
 has_many :todo_tasks, dependent: :destroy
end




#### app/models/todo_status.rb

```ruby
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TodoStatus extends Model
{
    // バリデーション
    // validates :name, presence: true, uniqueness: true
    // validates :label, presence: true

    // リレーション
    public function todoTasks()
    {
        return $this->hasMany(TodoTask::class);
    }
}
```