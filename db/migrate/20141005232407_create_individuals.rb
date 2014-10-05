class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.date :date_of_birth
      t.integer :ssn
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
