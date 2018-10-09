require 'rails_helper'

RSpec.describe "Skiings", type: :request do
  describe "GET /skiings" do
    it "works! (now write some real specs)" do
      get skiings_path
      expect(response).to have_http_status(200)
    end
  end
end
