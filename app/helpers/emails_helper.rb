module EmailsHelper


  def process_email args
    DailyReport.new(content: args["stripped-text"])
  end

end
