class AddPictureToStreams < ActiveRecord::Migration[5.1]
  def change
    add_column :streams, :picture, :string
  end
end
