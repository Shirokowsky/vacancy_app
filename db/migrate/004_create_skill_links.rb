class CreateSkillLinks < ActiveRecord::Migration
  def change
    create_table :skill_links do |t|
      t.integer :skill_id
      t.references :skillable, polymorphic: true, index: true
      t.timestamps
    end
  end
end