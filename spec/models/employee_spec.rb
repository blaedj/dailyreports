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

  end

  describe "with invalid data" do
    it "should not be valid" do
      @employee.name = nil
      expect(@employee).not_to be_valid
    end

  end


end
