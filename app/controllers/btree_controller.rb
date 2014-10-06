class BtreeController < ApplicationController
  before_filter :init_braintree
  
  def get_btree
  end
  
  def create_submerchant
    result = Braintree::MerchantAccount.create(
        :individual => {
          :first_name => "Jane",
          :last_name => "Doe",
          :email => "jane@14ladders.com",
          :phone => "5553334444",
          :date_of_birth => "1981-11-19",
          :ssn => "456-45-4567",
          :address => {
            :street_address => "111 Main St",
            :locality => "Chicago",
            :region => "IL",
            :postal_code => "60622"
          }
        },
        :business => {
          :legal_name => "Jane's Ladders",
          :dba_name => "Jane's Ladders",
          :tax_id => "98-7654321",
          :address => {
            :street_address => "111 Main St",
            :locality => "Chicago",
            :region => "IL",
            :postal_code => "60622"
          }
        },
        :funding => {
          :destination => Braintree::MerchantAccount::FundingDestination::Bank,
          :email => "funding@blueladders.com",
          :mobile_phone => "5555555555",
          :account_number => "1123581321",
          :routing_number => "071101307"
        },
        :tos_accepted => true,
        :master_merchant_account_id => "rgw233jmnzhxz3fs",  
        :id => "#{params[:id]}"
      )
    
    respond_to do |format|
      if result.success?
        format.html { redirect_to root_path, notice: "#{result.merchant_account.id} is #{result.merchant_account.status}" }
      else
        format.html { redirect_to root_path, notice: "#{result.errors}"}
      end
    end   
    
  end
  
  
  def init_braintree
    require "rubygems"
    require "braintree"

    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = 'wnvz9cp784t4nfx5'
    Braintree::Configuration.public_key = '5txjyzgkjx5nx2bp'
    Braintree::Configuration.private_key = '03313b7aa9454f3a5ea746bb0f08c0b0'
  end
end