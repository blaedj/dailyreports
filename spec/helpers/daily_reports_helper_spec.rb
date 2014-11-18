require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DailyReportsHelper. For example:
#
# describe DailyReportsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DailyReportsHelper, :type => :helper do
  describe "link_to_daily_report given day and employee" do
    it "should give a link to correct daily report for day and employee" do
      date = DateTime.now
      employee = FactoryGirl.create(:active_employee)
      daily_report = FactoryGirl.create(:daily_report, employee_id: employee.id, date: Date.today)
      expect(link_to_daily_report(date, employee.id)).to eql("/daily_reports/#{daily_report.id}")
    end
  end
  describe "link_to_daily_report with nil params" do
    it "should return an empty string" do
      expect(link_to_daily_report(nil, nil)).to eql("")
    end
  end


end
