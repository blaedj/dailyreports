require 'rails_helper'

RSpec.describe Employee, :type => :model do

  before do
    @employee = FactoryGirl.create(:employee)
  end
  subject {@employee}

  describe "with valid data" do
    it "should have a name" do
      expect(@employee).to respond_to :name
    end
    it "should have daily reports" do
      expect(@employee).to respond_to :daily_reports
    end
    it "should have an email" do
      expect(@employee).to respond_to :email
    end

  end

  describe "with invalid data" do
    it "should not be valid" do
      @employee.name = nil
      expect(@employee).not_to be_valid
    end
  end

  describe "when asked for daily reports" do

    describe "for a day with a daily report" do
      it "should return a daily report for that day" do
        today = Date.new(2014, 1, 4)
        test_report = FactoryGirl.create(:daily_report, date: today, employee_id: @employee.id )
        expect(@employee.report_for_date(today).date).to eq(today)
      end
    end

    describe "for a given date range" do
      it "should return reports for employee in that range" do
        today = Date.new(2014, 1, 4)
        FactoryGirl.create(:daily_report, date: today, employee_id: @employee.id )
        FactoryGirl.create(:daily_report, date: today + 1, employee_id: @employee.id )
        FactoryGirl.create(:daily_report, date: today + 2, employee_id: @employee.id )
        range = Date.new(2014, 1, 4)..Date.new(2014, 1, 6)
        expect(@employee.reports_for_range(range).count).to eq(3)
      end
    end

  end

  describe "recieved_for?, given a date" do
    some_date = Date.new(2014, 3, 4)
    before do
      FactoryGirl.create(:daily_report, date: some_date, employee_id: @employee.id )
    end

    it "should respond with true if a report exists for that date" do
      expect(@employee.recieved_for?( some_date)).to be_truthy
      expect("This test doesn't test properly, or else this functionality fails further up the stack.").to eql('')
    end

    it "should respond false if no report exists for that date" do
      expect(@employee.recieved_for?(some_date + 1)).to be_falsy
    end

  end



end
