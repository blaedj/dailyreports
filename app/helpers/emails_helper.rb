module EmailsHelper


  def process_email args
    email = parse_email(args["Return-Path"])
    employee = Employee.find_by_email(email)
    emp_id = employee.nil? ? "" : employee.id
    DailyReport.new(content: args["stripped-text"], employee_id: emp_id)
  end

  def parse_email email
    email.sub(/^</, '').sub(/>$/, '')
  end

end
