require 'rails_helper'

RSpec.describe Report, :type => :model do
  before do
    FactoryGirl.create(:active_employee, id: 1)
    FactoryGirl.create(:active_employee, id: 2)
    @report = new_report
  end

  context "with valid data" do
    it "should have start date" do
      expect(@report).to respond_to :date_start
    end
    it "should have end date" do
      expect(@report).to respond_to :date_end
    end
    it "should have employees" do
      expect(@report).to respond_to :employees
      expect(@report.employees).not_to be_empty
    end
  end

  context "with no data" do
    it "should return an empty report" do
      expect(Report.new()).not_to be_nil
    end
    it "it should have no data" do
      report = Report.new
      expect(report.date_start).to be_nil
      expect(report.date_end).to be_nil
      expect(report.employees).to be_nil
    end
  end

  describe "get_employees" do
    it "should return a list of employees" do
      expect(@report.get_employees([1, 2]) ).not_to be_empty
      expect(@report.get_employees([1, 2]).first).to respond_to(:name, :active)
    end
    it "should filter out empty values" do
      expect(@report.get_employees(["", 1, 2]).first).to respond_to(:name, :active)
    end
  end

  context "generation" do
    it "should generate a valid report" do
      expect(@report.reports).not_to be_empty
    end
  end

  describe "range of reports" do
    pending "need to figure out a way to conveniently render reports: how do I test that I can get a range of reports? possibly "

    it "should not include more than a week of reports" do
      pending "pass in a week possible? what is the API like for ruby weeks?"
      raise "broken"
    end

  end

end

def new_report
  params = {start_date: Date.new(2014, 6, 1), end_date: Date.new(2014, 6, 7), employees: [1,2] }
  Report.new(params)
end
