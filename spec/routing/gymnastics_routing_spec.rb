require "rails_helper"

RSpec.describe GymnasticsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gymnastics").to route_to("gymnastics#index")
    end


    it "routes to #show" do
      expect(:get => "/gymnastics/1").to route_to("gymnastics#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/gymnastics").to route_to("gymnastics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gymnastics/1").to route_to("gymnastics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gymnastics/1").to route_to("gymnastics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gymnastics/1").to route_to("gymnastics#destroy", :id => "1")
    end

  end
end
