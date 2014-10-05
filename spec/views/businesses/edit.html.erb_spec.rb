require 'rails_helper'

RSpec.describe "businesses/edit", :type => :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :leagal_name => "MyString",
      :dba_name => "MyString",
      :tax_id => 1,
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1
    ))
  end

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

      assert_select "input#business_leagal_name[name=?]", "business[leagal_name]"

      assert_select "input#business_dba_name[name=?]", "business[dba_name]"

      assert_select "input#business_tax_id[name=?]", "business[tax_id]"

      assert_select "input#business_street_address[name=?]", "business[street_address]"

      assert_select "input#business_city[name=?]", "business[city]"

      assert_select "input#business_state[name=?]", "business[state]"

      assert_select "input#business_zip[name=?]", "business[zip]"
    end
  end
end
