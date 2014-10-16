require 'rails_helper'

RSpec.describe EmailsController, :type => :controller do


  describe "posting to emails/recieve" do
    describe "with valid parametrs" do
      params = {
        "stripped-text" => "no longer checking the authenticity token when receiving emails",
        "body-plain"    => "no longer checking the authenticity token when receiving emails\r\n",
        "Date"          => "Mon, 13 Oct 2014 14:38:29 -0500",
        "timestamp"     => "1413229117",
        "Return-Path"=>"<test@test.com>",
      }
#      allow(EmailsHelper).to receive(process_email).and_return(FactoryGirl.create(:daily_report))
    end
  end


end
