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
    it "should respond to employee" do
      is_expected.to respond_to(:employee)
    end
  end

  describe "with invalid data" do

    it "should not be valid" do
      expect(FactoryGirl.build(:daily_report, date_recieved: nil)).not_to be_valid
      expect(FactoryGirl.build(:daily_report, content: nil)).not_to be_valid
      expect(FactoryGirl.build(:daily_report, date: nil)).not_to be_valid
      expect(FactoryGirl.build(:daily_report, employee_id: nil)).not_to be_valid
    end

  end

end
