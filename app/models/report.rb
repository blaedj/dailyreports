class Report
  include ActiveModel::Model
  attr_accessor :daily_reports, :employees, :date_start, :date_end, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
  validates :employees, presence: true

  ## creates a method for each day of the week that just returns the date of the contained 'Week' object.
  [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].each do |day|
    define_method("#{day}") do
      @week.send("#{day}")
    end
  end

  def initialize args={}
    args = nil_if_blank args
    generate(args[:date_start], args[:date_end], args[:employees]) unless args.empty?
  end

  def generate(date_start, date_end, employee_ids)
    date_start ||= Date.today
    @week = Week.new(date_start)
    @date_start = @week.start_date
    @date_end = @week.sunday #TODO: add a 'week_end' attr to the sane_week gem
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

  def nil_if_blank attrs
    attrs.each { |key, val| attrs[key] = nil if attrs[key].blank? }
  end



end
