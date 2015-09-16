class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.datetime :expired
      t.integer :salary, null: false, default: 0
      t.string :contact, null: false
      t.timestamps
    end
    add_index :vacancies, :title
  end
end

