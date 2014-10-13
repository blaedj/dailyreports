class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def recieve
    logger.info params
    render text: ''
  end

end
