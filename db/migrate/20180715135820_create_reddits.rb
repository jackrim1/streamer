class CreateReddits < ActiveRecord::Migration[5.1]
  def change
    create_table :reddits do |t|
      t.integer :user_id
      t.integer :stream_id

      t.timestamps
    end
  end
end
