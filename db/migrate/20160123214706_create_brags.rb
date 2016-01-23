class CreateBrags < ActiveRecord::Migration
  def change
    create_table :brags do |t|
      t.belongs_to :user
      t.string :title
      t.text :story

      t.timestamps null: false
    end
  end
end
