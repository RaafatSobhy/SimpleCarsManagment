require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :name => "Name",
        :horsepower => "",
        :price => "9.99",
        :car_type_id => ""
      ),
      Car.create!(
        :name => "Name",
        :horsepower => "",
        :price => "9.99",
        :car_type_id => ""
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
