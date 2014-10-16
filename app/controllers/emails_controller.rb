class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def recieve
    @email_processor = EmailProcessor.new
    logger.info params
    daily = @email_processor.process_email(params)
    daily.save
    render text: ''
  end

end
