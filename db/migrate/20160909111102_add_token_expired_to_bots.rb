class AddTokenExpiredToBots < ActiveRecord::Migration[5.0]
  def change
    add_column :bots, :token_expired, :datetime
  end
end
