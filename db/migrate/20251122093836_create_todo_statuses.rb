class CreateTodoStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_statuses do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
