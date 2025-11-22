class CreateTodoUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_users do |t|
    t.string :name, null:  false
    t.string :email, null: false
    t.string :encrypted_password,null: false

    t.timestamps
    end

    add_index :todo_users, :email, unique: true
  end
end
