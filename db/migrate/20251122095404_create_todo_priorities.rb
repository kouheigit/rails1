class CreateTodoPriorities < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_priorities do |t|
      t.string :name, null: false
      t.string :label, null: false
      t.integer :sort_order,default: 0

      t.timestamps
    end

    add_index :todo_priorities, :name, unique: true
  end
end
