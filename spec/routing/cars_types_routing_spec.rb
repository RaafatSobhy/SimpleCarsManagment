require "rails_helper"

RSpec.describe CarsTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cars_types").to route_to("cars_types#index")
    end

    it "routes to #new" do
      expect(:get => "/cars_types/new").to route_to("cars_types#new")
    end

    it "routes to #show" do
      expect(:get => "/cars_types/1").to route_to("cars_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cars_types/1/edit").to route_to("cars_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cars_types").to route_to("cars_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cars_types/1").to route_to("cars_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cars_types/1").to route_to("cars_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cars_types/1").to route_to("cars_types#destroy", :id => "1")
    end

  end
end
