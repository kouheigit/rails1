class CreateTodoStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_statuses do |t|
      t.string :name, null: false
      t.string :label, null: false

      t.timestamps
    end

    add_index :todo_statuses, :name, unique: true
  end
end
