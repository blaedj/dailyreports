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
        "Return-Path"=>"<test@test.com>",
      }
      @daily = process_email(@test_params)
      @test_employee = FactoryGirl.create(:active_employee, email: "test@test.com")
    end

    it "should get the plain body text" do
      expect(@daily.content).to eql("no longer checking the authenticity token when receiving emails")
    end
    it "should get the sender of the email" do
      allow(Employee).to receive(:find_by_email).and_return(@test_employee)
      @daily = process_email(@test_params)
      expect(@daily.employee).to eql(@test_employee)
    end
    describe "parse email from return path" do
      it "should extract the email" do
        expect(parse_email("<test@test.com>")).to eql("test@test.com")
      end
    end

    it "should get the date recieved" do
      expect(@daily.date_recieved).to eql(DateTime.parse("Mon, 13 Oct 2014 14:38:29 -0500"))
    end

    it "should get the date" do
      expect(@daily.date).to eql(DateTime.parse("Mon, 13 Oct 2014 14:38:29 -0500"))
    end

  end



end
