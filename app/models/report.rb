class Report
  include ActiveModel::Model
  attr_accessor :daily_reports, :employees, :date_start, :date_end
  validates :employees, presence: true

  def initialize args={}
    generate(args[:date_start], args[:date_end], args[:employees]) unless args.empty?
  end

  def generate(date_start, date_end, employee_ids)
    @date_start = date_start
    @date_end = date_end
    get_employees(employee_ids)
    generate_reports
  end

  def generate_reports
     @daily_reports = @employees.each_with_object({}) do |employee, hash|
      hash[employee.id] = employee.reports_for_range(@date_start..@date_end)
    end
  end

  def get_employees(employee_ids)
    @employees = Employee.find(employee_ids.reject(&:blank?))
  end

  def reports_for_employee employee_id
    @employees.find{ |emp| emp.id == employee_id }.reports_for_range(@date_start..@date_end)
  end

  private



end
