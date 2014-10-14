module EmailsHelper


  def process_email args
    email = parse_email(args["Return-Path"])
    emp_id = resolve_employee_id(email)
    DailyReport.new(content: args["stripped-text"], employee_id: emp_id, date_recieved: DateTime.parse(args["Date"]), date: DateTime.parse(args["Date"]))

  end

  def parse_email email
    email.sub(/^</, '').sub(/>$/, '')
  end


  private
  def resolve_employee_id email
    employee = Employee.find_by_email(email)
    employee.nil? ? "" : employee.id
  end

end
