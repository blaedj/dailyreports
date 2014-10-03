module ReportHelper

  def active_employees
    Employee.where(active: true)
  end

end
