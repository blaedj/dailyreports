require 'rails_helper'

RSpec.describe "employees/show", :type => :view do
  before(:each) do
    @employee = assign(:employee, FactoryGirl.create(:employee))
  end

  it "renders attributes in <p>" do
    render
  end

  it "shows the employees name" do
    render
    assert_select ""

  end



end
