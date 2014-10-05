require 'rails_helper'

RSpec.describe "businesses/index", :type => :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        :leagal_name => "Leagal Name",
        :dba_name => "Dba Name",
        :tax_id => 1,
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => 2
      ),
      Business.create!(
        :leagal_name => "Leagal Name",
        :dba_name => "Dba Name",
        :tax_id => 1,
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => 2
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", :text => "Leagal Name".to_s, :count => 2
    assert_select "tr>td", :text => "Dba Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
