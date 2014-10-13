class EmailsController < ApplicationController


  def post
    logger.info params
    render text: ''
  end

end
