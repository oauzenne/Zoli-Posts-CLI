class CreateSendersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :senders do |t|
      t.string :name
      t.string :password
      t.string :address
      t.string :email
    end
  end
end
