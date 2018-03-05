require 'rails_helper'

RSpec.describe "cars_types/index", type: :view do
  before(:each) do
    assign(:cars_types, [
      CarsType.create!(
        :car_type => "Car Type"
      ),
      CarsType.create!(
        :car_type => "Car Type"
      )
    ])
  end

  it "renders a list of cars_types" do
    render
    assert_select "tr>td", :text => "Car Type".to_s, :count => 2
  end
end
