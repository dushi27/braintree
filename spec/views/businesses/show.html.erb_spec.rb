require 'rails_helper'

RSpec.describe "businesses/show", :type => :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :leagal_name => "Leagal Name",
      :dba_name => "Dba Name",
      :tax_id => 1,
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Leagal Name/)
    expect(rendered).to match(/Dba Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/2/)
  end
end
