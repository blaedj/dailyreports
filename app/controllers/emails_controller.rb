class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def recieve
    logger.info params
    daily = process_email(args)
    daily.save
    render text: ''
  end

end
