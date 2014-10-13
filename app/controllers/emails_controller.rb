class EmailsController < ApplicationController


  def recieve
    logger.info params
    render text: ''
  end

end
