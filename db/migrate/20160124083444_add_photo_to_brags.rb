class AddPhotoToBrags < ActiveRecord::Migration
  def change
    add_column :brags, :photo, :string
  end
end
