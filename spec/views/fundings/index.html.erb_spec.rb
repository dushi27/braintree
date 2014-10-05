require 'rails_helper'

RSpec.describe "fundings/index", :type => :view do
  before(:each) do
    assign(:fundings, [
      Funding.create!(
        :email => "Email",
        :phone => 1,
        :account_number => 2,
        :routing_no => 3,
        :agreed => false
      ),
      Funding.create!(
        :email => "Email",
        :phone => 1,
        :account_number => 2,
        :routing_no => 3,
        :agreed => false
      )
    ])
  end

  it "renders a list of fundings" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
