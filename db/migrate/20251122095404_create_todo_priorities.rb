class CreateTodoPriorities < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_priorities do |t|
      t.string :name
      t.string :label
      t.integer :sort_order

      t.timestamps
    end
  end
end
