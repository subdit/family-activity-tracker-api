require "rails_helper"

RSpec.describe SwimmingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/swimmings").to route_to("swimmings#index")
    end


    it "routes to #show" do
      expect(:get => "/swimmings/1").to route_to("swimmings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/swimmings").to route_to("swimmings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/swimmings/1").to route_to("swimmings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/swimmings/1").to route_to("swimmings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/swimmings/1").to route_to("swimmings#destroy", :id => "1")
    end

  end
end
