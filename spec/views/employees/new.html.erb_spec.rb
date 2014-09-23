require 'rails_helper'

RSpec.describe "employees/new", :type => :view do
  before(:each) do
    assign(:employee, Employee.new())
  end

  it "renders new employee form" do
    render



    assert_select "form[action=?][method=?]", employees_path, "post" do
    end

  end
  it "has the necessary form inputs" do
    render
    assert_select "input#employee_name"
  end

end
