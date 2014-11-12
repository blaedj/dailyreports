class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: [:show, :edit, :update, :destroy]

  def index
    @daily_reports = DailyReport.all
  end

  def new
    @daily_report = DailyReport.new
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    #@daily_report = DailyReport.find(dr_params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_report
      @daily_report = DailyReport.find(dr_params[:id])
    end


  def dr_params
    params.require(:daily_report).permit(:id, :employee)
  end

end
