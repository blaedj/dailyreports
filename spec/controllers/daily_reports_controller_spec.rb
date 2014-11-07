require 'rails_helper'

RSpec.describe DailyReportsController, :type => :controller do

  let(:params) { @daily_report.attributes.symbolize_keys }

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET show" do
    before(:each ) do
      @daily_report = FactoryGirl.create(:daily_report)
    end
    it "returns http success" do
      get :show, {:daily_report => params}
      expect(response).to be_success
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end



end
