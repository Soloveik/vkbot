class CreateBots < ActiveRecord::Migration[5.0]
  def change
    create_table :bots do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.integer :friends
      t.integer :followers
      t.string :token
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
