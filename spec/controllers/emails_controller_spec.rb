require 'rails_helper'

RSpec.describe EmailsController, :type => :controller do

  describe "POST #recieve" do
    describe "with valid parameters" do
      it "succeeds" do
        params = {
          "stripped-text" => "no longer checking the authenticity token when receiving emails",
          "body-plain"    => "no longer checking the authenticity token when receiving emails\r\n",
          "Date"          => "Mon, 13 Oct 2014 14:38:29 -0500",
          "timestamp"     => "1413229117",
          "Return-Path"   => "<test@test.com>"
        }
        post :recieve, params
        expect(response).to be_success
      end
    end
  end


end
