class EmailsController < ApplicationController


  def post params
    logger.info params
    render text: ''
  end

end
