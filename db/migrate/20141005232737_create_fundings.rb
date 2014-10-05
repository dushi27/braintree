class CreateFundings < ActiveRecord::Migration
  def change
    create_table :fundings do |t|
      t.string :email
      t.integer :phone
      t.integer :account_number
      t.integer :routing_no
      t.boolean :agreed

      t.timestamps
    end
  end
end
