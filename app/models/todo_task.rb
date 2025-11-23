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

end


```