require 'rails_helper'

RSpec.describe "Individuals", :type => :request do
  describe "GET /individuals" do
    it "works! (now write some real specs)" do
      get individuals_path
      expect(response.status).to be(200)
    end
  end
end
