require 'rails_helper'

RSpec.describe "individuals/new", :type => :view do
  before(:each) do
    assign(:individual, Individual.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => 1,
      :ssn => 1,
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1
    ))
  end

  it "renders new individual form" do
    render

    assert_select "form[action=?][method=?]", individuals_path, "post" do

      assert_select "input#individual_first_name[name=?]", "individual[first_name]"

      assert_select "input#individual_last_name[name=?]", "individual[last_name]"

      assert_select "input#individual_email[name=?]", "individual[email]"

      assert_select "input#individual_phone[name=?]", "individual[phone]"

      assert_select "input#individual_ssn[name=?]", "individual[ssn]"

      assert_select "input#individual_street_address[name=?]", "individual[street_address]"

      assert_select "input#individual_city[name=?]", "individual[city]"

      assert_select "input#individual_state[name=?]", "individual[state]"

      assert_select "input#individual_zip[name=?]", "individual[zip]"
    end
  end
end
