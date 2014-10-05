require 'rails_helper'

RSpec.describe "individuals/index", :type => :view do
  before(:each) do
    assign(:individuals, [
      Individual.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1,
        :ssn => 2,
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => 3
      ),
      Individual.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1,
        :ssn => 2,
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => 3
      )
    ])
  end

  it "renders a list of individuals" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
