require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReportsHelper. For example:
#
# describe ReportsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReportsHelper, :type => :helper do

  describe "active_employees method" do
    before do
      FactoryGirl.create(:active_employee)
      FactoryGirl.create(:inactive_employee, name: "Joe")
      FactoryGirl.create(:active_employee, name: "John")
    end

    it "should respond with a list of employees" do
      expect(active_employees[0]).to respond_to(:name)
      expect(active_employees[1]).to respond_to(:name)
    end

    it "should only return active employees" do
      # expect(active_employees[0].active?).to eq(true)
      # expect(active_employees[1].active?).to eq(true)
      expect(active_employees.where(active: false).size).to eq(0)
    end
  end

  describe "link to report for day" do
    it "should provide a link to view the daily report for a given employee and day" do
      pending("may be better as a feature/request spec? unsure...")
      fail("not implemented")
    end
  end

end
