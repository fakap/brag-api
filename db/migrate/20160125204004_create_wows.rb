class CreateWows < ActiveRecord::Migration
  def change
    create_table :wows do |t|
      t.belongs_to :user
      t.belongs_to :brag
      
      
      t.timestamps null: false
    end
  end
end
