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
    it "should provide a link to view the daily report" do
      daily_report = FactoryGirl.create(:daily_report)
      employee =  FactoryGirl.create(:employee)
      link = link_to_daily_report(daily_report.date, employee.id)
      expect(link).to eql('/daily_reports/2')
    end
    it "should give the correct report for day and employee" do
      date = Date.today
      employee = FactoryGirl.create(:active_employee)
      daily_report = FactoryGirl.create(:daily_report, employee_id: employee.id, date: date)
      expect(link_to_daily_report(date, employee.id)).to eql("/daily_report/#{daily_report.id}")
    end
  end
  describe "" do

  end



end
