class AddIndividualIdToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :individual_id, :integer
  end
end
