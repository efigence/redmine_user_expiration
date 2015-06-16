class CreateExpirations < ActiveRecord::Migration
  def change
    add_column :users, :expiration_date, :datetime, null: true
  end
end
