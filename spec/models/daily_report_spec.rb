require 'rails_helper'

RSpec.describe DailyReport, :type => :model do

  before do
    @daily_report = FactoryGirl.create(:daily_report)
  end

  subject {@daily_report}

  describe "With valid data" do
    it "should be valid" do
      is_expected.to be_valid
    end
    it "should respond to date_recieved" do
      is_expected.to respond_to(:date_recieved)
    end
    it "should respond to content" do
      is_expected.to respond_to(:content)
    end
    it "should respond to date" do
      is_expected.to respond_to(:date)
    end
    it "should respond to created_at" do
      is_expected.to respond_to(:created_at)
    end
    it "should respond to updated_at" do
      is_expected.to respond_to(:updated_at)
    end
    it "should respond to employee_id" do
      is_expected.to respond_to(:employee_id)
    end
  end

  describe "with invalid data" do

    it "should not be valid" do
      @daily_report.date_recieved = nil
      @daily_report.content = nil
      @daily_report.date = nil
      @daily_report.employee_id = nil
      is_expected.not_to be_valid
    end

  end


end
