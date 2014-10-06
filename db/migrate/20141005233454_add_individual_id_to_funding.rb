class AddIndividualIdToFunding < ActiveRecord::Migration
  def change
    add_column :fundings, :individual_id, :integer
  end
end
