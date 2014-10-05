require 'rails_helper'

RSpec.describe "fundings/show", :type => :view do
  before(:each) do
    @funding = assign(:funding, Funding.create!(
      :email => "Email",
      :phone => 1,
      :account_number => 2,
      :routing_no => 3,
      :agreed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
