require "rails_helper"

RSpec.describe SkiingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/skiings").to route_to("skiings#index")
    end


    it "routes to #show" do
      expect(:get => "/skiings/1").to route_to("skiings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/skiings").to route_to("skiings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/skiings/1").to route_to("skiings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/skiings/1").to route_to("skiings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/skiings/1").to route_to("skiings#destroy", :id => "1")
    end

  end
end
