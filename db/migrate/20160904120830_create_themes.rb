class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :gid
      t.string :tid
      t.string :theme

      t.timestamps
    end
  end
end
