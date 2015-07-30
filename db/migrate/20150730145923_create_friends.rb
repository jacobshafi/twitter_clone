class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :following
      t.integer :follower

      t.timestamps
    end
  end
end
