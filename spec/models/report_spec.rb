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
    it "should have no data" do
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

  describe "given one date" do
    starting_date = Date.new(2014, 10, 7)
    ending_date =  Date.new(2014, 10, 12)
    before do
      @report = Report.new(start_date: starting_date, employees: [1,2])
    end

    it "should get the reports for the week containing that date" do
      @report.reports_for_employee(1).first(5).each { |daily| expect(daily.date).to be_between(starting_date - 1, ending_date).inclusive }
    end

  end

  describe "when asked for days of the week" do
    it "should respond with the correct date" do
      expect(@report.monday).to eql(Date.new(2014, 05, 26))
    end
  end

  describe "given no start date" do
    it "should default to the current date" do
      allow(Date).to receive(:today).and_return(Date.new(2014, 10, 20))
      expect(Report.new({employees: [1,2]}).date_start).to eql(Date.new(2014, 10, 20))
    end
  end

  describe "initialized with blank or mis-formed paramters" do
    it "should handle blank-string date values" do
      expect(Report.new({date_start: "", employees: [1,2]})).to be_valid
    end
    it "should not be valid when not given any employees" do
      bad_params = {date_start: Date.new(2014, 6, 1), date_end: Date.new(2014, 6, 7), employees: nil }
      expect(Report.new(bad_params)).not_to be_valid
    end
  end

end

def new_report params = nil
  params ||= {date_start: Date.new(2014, 6, 1), date_end: Date.new(2014, 6, 7), employees: [1,2] }
  Report.new(params)
end
