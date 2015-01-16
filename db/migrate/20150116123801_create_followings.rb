class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references  :leader
      t.references  :follower

      t.timestamps
    end
  end
end
