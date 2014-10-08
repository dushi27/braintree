class BtreeController < ApplicationController
  before_filter :init_braintree
  
  def get_btree
  end
  
  def create_submerchant
    result = Braintree::MerchantAccount.create(
        :individual => {
          :first_name =>  "#{params[:first_name]}",
          :last_name =>  "#{params[:last_name]}",
          :email => "#{params[:email]}",
          :date_of_birth => "#{params[:dob]}",
          :address => {
            :street_address => "#{params[:street]}",
            :locality => "#{params[:city]}",
            :region => "#{params[:state]}",
            :postal_code => "#{params[:zip]}"
          }
        },
        :business => {
          :legal_name => "#{params[:legal_name]}",
          :dba_name => "#{params[:dba]}",
          :tax_id => "#{params[:tax_id]}"          
        },
        :funding => {
          :destination => "bank",
          :account_number => "#{params[:acctno]}",
          :routing_number => "#{params[:routing]}"
        },
        :tos_accepted => "#{params[:tos]}",
        :master_merchant_account_id => "rgw233jmnzhxz3fs",  
        :id => "#{params[:id]}"
      )
    
    respond_to do |format|
      if result.success?
        format.html { redirect_to root_path, notice: "#{result.merchant_account.id} is #{result.merchant_account.status}" }
      else
        format.html { redirect_to root_path, notice: "#{result.errors.each {|err| puts err.message + ","}}"}
      end
    end   
    
  end
  
  
  def init_braintree
    require "rubygems"
    require "braintree"

    API keys
  end
end