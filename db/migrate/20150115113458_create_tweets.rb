class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :category
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
