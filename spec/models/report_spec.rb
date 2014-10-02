require 'rails_helper'

RSpec.describe Report, :type => :model do
  before do
    @report = FactoryGirl.build(:report)
  end

  describe "with valid data" do

    it "should have start and end dates " do
      expect(@report).to respond_to :date_start
      expect(@report).to respond_to :date_end
    end

    it "should have employees" do
      expect(@report).to respond_to :employees
    end

  end

end
