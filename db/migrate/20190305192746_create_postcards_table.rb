class CreatePostcardsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :postcards do |t|
      t.belongs_to :sender
      t.belongs_to :receiver
      t.string :category 
      t.string :size
      t.string :deco
      t.float :cost
      t.string :message
    end
  end
end
