require 'rails_helper'

RSpec.describe "CarsTypes", type: :request do
  describe "GET /cars_types" do
    it "works! (now write some real specs)" do
      get cars_types_path
      expect(response).to have_http_status(200)
    end
  end
end
