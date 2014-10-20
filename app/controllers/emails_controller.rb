class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def recieve
    @email_processor = EmailProcessor.new
    logger.info params
    daily = @email_processor.process_email(params)
    if daily.save
      render text: ''
    else
      all_errors = daily.errors.full_messages.reduce {|s, message| s += message }
      logger.error "Validation Errors: \n #{all_errors}"
      head 500
    end

  end

end
