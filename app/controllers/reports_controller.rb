class ReportsController < ApplicationController
  #before_action :parse_dates, only: [:create] # amke sure the dates are not strings but Dates


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

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    good_params = whitelist_params
    good_params[:date_start] = DateTime.parse(good_params[:date_start])
    good_params[:date_end] = DateTime.parse(good_params[:date_end])
    good_params
  end

  def whitelist_params
    params.require(:report).permit(:date_end, :date_start, :employees => [] )
  end

end
