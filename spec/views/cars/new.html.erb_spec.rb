require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      :name => "MyString",
      :horsepower => "",
      :price => "9.99",
      :car_type_id => ""
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "input[name=?]", "car[name]"

      assert_select "input[name=?]", "car[horsepower]"

      assert_select "input[name=?]", "car[price]"

      assert_select "input[name=?]", "car[car_type_id]"
    end
  end
end
