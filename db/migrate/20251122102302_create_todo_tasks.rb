class CreateTodoTasks < ActiveRecord::Migration[7.1]
 def change
     create_table :todo_tasks do |t|
       t.references :todo_user, null: false, foreign_key: true
       t.string :title, null: false
       t.text :description
       t.datetime :due_date
       t.references :todo_status, null: false, foreign_key: true
       t.references :todo_priority, null: false, foreign_key: true

       t.timestamps
    end
  end
end