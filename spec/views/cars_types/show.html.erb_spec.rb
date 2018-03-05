require 'rails_helper'

RSpec.describe "cars_types/show", type: :view do
  before(:each) do
    @cars_type = assign(:cars_type, CarsType.create!(
      :car_type => "Car Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Car Type/)
  end
end
