module DailyReportsHelper

  def link_to_daily_report(date, employee_id)
    #TODO: should handle both an employee object and an employee id
    if(date.nil? or employee_id.nil?)
      return ''
    end
    dr_matches = DailyReport.where('date(date) = ?', date).where('employee_id = ?', employee_id)
    first_match = dr_matches.first
    daily_report_path(first_match)
  end

end
