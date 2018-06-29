class AddUserIdToStreams < ActiveRecord::Migration[5.1]
  def change
    add_column :streams, :user_id, :integer
  end
end
