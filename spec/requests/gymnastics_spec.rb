require 'rails_helper'

RSpec.describe "Gymnastics", type: :request do
  describe "GET /gymnastics" do
    it "works! (now write some real specs)" do
      get gymnastics_path
      expect(response).to have_http_status(200)
    end
  end
end
