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

      result[:quarterbacks].each do |qb|
        expect(qb[:position]).to eq("QB")
      end
    end
    
    it "gets request for all runningbacks" do
      5.times do
        create(:football_player, position: "RB")
      end

      get "/api/v1/runningbacks.json"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(result[:runningbacks].count).to eq(5)

      result[:runningbacks].each do |rb|
        expect(rb[:position]).to eq("RB")
      end
    end

    it "gets request for all wide receivers" do
      5.times do
        create(:football_player, position: "WR")
      end

      get "/api/v1/receivers.json"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(result[:receivers].count).to eq(5)

      result[:receivers].each do |wr|
        expect(wr[:position]).to eq("WR")
      end
    end

    it "gets request for all tightends" do
      5.times do
        create(:football_player, position: "TE")
      end

      get "/api/v1/tightends.json"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(result[:tightends].count).to eq(5)

      result[:tightends].each do |te|
        expect(te[:position]).to eq("TE")
      end
    end

    it "gets request for all defenses" do
      create_list(:defense, 5)

      get "/api/v1/defenses.json"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(result[:defenses].count).to eq(5)
    end
  end
end