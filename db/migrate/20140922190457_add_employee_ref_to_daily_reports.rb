class AddEmployeeRefToDailyReports < ActiveRecord::Migration
  def change
    add_reference :daily_reports, :employee, index: true
  end
end
