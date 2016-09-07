class AddRequestsToBots < ActiveRecord::Migration[5.0]
  def change
    add_column :bots, :requests, :integer
  end
end
