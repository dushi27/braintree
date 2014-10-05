require 'rails_helper'

RSpec.describe "individuals/show", :type => :view do
  before(:each) do
    @individual = assign(:individual, Individual.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => 1,
      :ssn => 2,
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/3/)
  end
end
