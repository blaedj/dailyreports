class ReportsController < ApplicationController

  # GET /reports/new
  def new
    @report = Report.new
  end

  def create
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    set_employees
    respond_to do |format|
      if @report
        flash[:success] = "Report was successfully created."
        format.html { render :show }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  private

  def set_employees
    #@report.employees = report_params[:employees].map { |empid| Employee.find(empid) }
    @report.employees = Employee.find(report_params[:employees])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:employees, :date_end, :date_start)
  end

end
