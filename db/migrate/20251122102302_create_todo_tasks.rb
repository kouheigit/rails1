class CreateTodoTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_tasks do |t|

      t.timestamps
    end
  end
end
