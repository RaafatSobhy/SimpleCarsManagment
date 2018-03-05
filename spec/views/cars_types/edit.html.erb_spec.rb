require 'rails_helper'

RSpec.describe "cars_types/edit", type: :view do
  before(:each) do
    @cars_type = assign(:cars_type, CarsType.create!(
      :car_type => "MyString"
    ))
  end

  it "renders the edit cars_type form" do
    render

    assert_select "form[action=?][method=?]", cars_type_path(@cars_type), "post" do

      assert_select "input[name=?]", "cars_type[car_type]"
    end
  end
end
