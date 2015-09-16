class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :contact, null: false
      t.boolean :status, null: false, default: true
      t.integer :salary, null: false, default: 0
      t.timestamps
    end
    add_index :employees, :name
  end
end
