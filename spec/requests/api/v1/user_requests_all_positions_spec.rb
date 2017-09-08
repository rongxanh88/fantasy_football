require "rails_helper"

RSpec.describe "All Positions", :type => :request do

  context "successful requests" do
    it "gets request for all quarterbacks" do
      5.times do
        create(:football_player, position: "QB")
      end
      
      get "/api/v1/quarterbacks.json"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(result[:quarterbacks].count).to eq(5)
    end
    
    it "gets request for all runningbacks" do
      
    end

    it "gets request for all wide receivers" do
      
    end

    it "gets request for all tightends" do
      
    end

    it "gets request for all defenses" do
      
    end
  end
end