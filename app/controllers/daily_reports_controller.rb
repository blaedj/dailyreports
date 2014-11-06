class DailyReportsController < ApplicationController

  def index
    @daily_reports = DailyReport.all
  end

  def new
    @daily_report = DailyReport.new
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @daily_report = DailyReport.find(dr_params[:id])
  end

  def dr_params
    params.require(:daily_report).permit(:id, :employee)
  end

end
