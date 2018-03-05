require 'rails_helper'

RSpec.describe "cars_types/new", type: :view do
  before(:each) do
    assign(:cars_type, CarsType.new(
      :car_type => "MyString"
    ))
  end

  it "renders new cars_type form" do
    render

    assert_select "form[action=?][method=?]", cars_types_path, "post" do

      assert_select "input[name=?]", "cars_type[car_type]"
    end
  end
end
