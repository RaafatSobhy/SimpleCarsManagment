require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :name => "MyString",
      :horsepower => "",
      :price => "9.99",
      :car_type_id => ""
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input[name=?]", "car[name]"

      assert_select "input[name=?]", "car[horsepower]"

      assert_select "input[name=?]", "car[price]"

      assert_select "input[name=?]", "car[car_type_id]"
    end
  end
end
