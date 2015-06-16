class CreateExpirations < ActiveRecord::Migration
  def change
    create_table :expirations do |t|
      t.integer :user_id
      t.date :expiration_date

      # add_index :expirations, :user_id, :unique => true
    end
  end
end
