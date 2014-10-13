require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EmailsHelper. For example:
#
# describe EmailsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EmailsHelper, :type => :helper do



  describe "parsing emails" do
    before do
      @test_params = {
        "stripped-text" => "no longer checking the authenticity token when receiving emails",
        "body-plain"    => "no longer checking the authenticity token when receiving emails\r\n",
        "Date"          => "Mon, 13 Oct 2014 14:38:29 -0500",
        "timestamp"     => "1413229117",
        "Return-Path"=>"<menge051@d.umn.edu>",
      }
      @daily = process_email(@test_params)
      @test_employee = FactoryGirl.create(:active_employee)
    end

    it "should get the plain body text" do
      expect(@daily.content).to eql("no longer checking the authenticity token when receiving emails")
    end
    it "should get the sender of the email" do
      allow(Employee).to receive(:find).and_return(@test_employee)
      expect(@daily.employee).to eql(@test_employee)
    end

  end



end
