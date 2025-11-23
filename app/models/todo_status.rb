class TodoStatus < ApplicationRecord
 #バリデーション(バリデーションはRailsではModelに記述する)
 validates :name, presence: true, uniqueness: true
 validates :label,presence: true

 #リレーション
 has_many :todo_tasks, dependent: :destroy
end




#### app/models/todo_status.rb

```ruby
class TodoStatus < ApplicationRecord
  # バリデーション
  validates :name, presence: true, uniqueness: true
  validates :label, presence: true

  # リレーション
  has_many :todo_tasks, dependent: :destroy
end
```