class CreateHeroines < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :heroines, :powers

    create_table :heroines do |t|
      t.string :name
      t.string :super_name
      t.integer :power_id

      t.timestamps
    end
  end
end
