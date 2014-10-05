require 'rails_helper'

RSpec.describe "fundings/new", :type => :view do
  before(:each) do
    assign(:funding, Funding.new(
      :email => "MyString",
      :phone => 1,
      :account_number => 1,
      :routing_no => 1,
      :agreed => false
    ))
  end

  it "renders new funding form" do
    render

    assert_select "form[action=?][method=?]", fundings_path, "post" do

      assert_select "input#funding_email[name=?]", "funding[email]"

      assert_select "input#funding_phone[name=?]", "funding[phone]"

      assert_select "input#funding_account_number[name=?]", "funding[account_number]"

      assert_select "input#funding_routing_no[name=?]", "funding[routing_no]"

      assert_select "input#funding_agreed[name=?]", "funding[agreed]"
    end
  end
end
