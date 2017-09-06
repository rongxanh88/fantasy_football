class PlayerStats
  attr_reader :pass_yards, :pass_tds, :pass_ints, :rush_yards, :rush_tds,
              :receptions, :rec_yards, :fum_lost, :kick_ret_td, :punt_ret_td,
              :rec_tds

  FANTASY_POINTS = {
    "pass_tds": 4,
    "pass_yards": 0.04,
    "pass_ints": -1,
    "rec_tds": 6,
    "rec_yards": 0.1,
    "receptions": 1,
    "rush_tds": 6,
    "rush_yards": 0.1,
    "punt_ret_td": 6,
    "kick_ret_td": 6,
    "fum_lost": -1,
    "pass_yards_300": 3,
    "rush_or_rec_yards_100": 3
  }

  def initialize(attrs)
    @pass_yards  = attrs[:PassYards]
    @pass_tds    = attrs[:PassTD]
    @pass_ints   = attrs[:PassInt]
    @rush_yards  = attrs[:RushYards]
    @rush_tds    = attrs[:RushTD]
    @rec_tds     = attrs[:RecTD]
    @receptions  = attrs[:Receptions]
    @rec_yards   = attrs[:RecYards]
    @fum_lost    = attrs[:FumLost]
    @kick_ret_td = attrs[:KrTD]
    @punt_ret_td = attrs[:PrTD]
  end

  def self.calculate_expected_point_production(stat)
    expected_production = 0
    expected_production += (stat.pass_tds[:"#text"].to_i * FANTASY_POINTS[:pass_tds])
    expected_production += (stat.pass_yards[:"#text"].to_i * FANTASY_POINTS[:pass_yards])
    expected_production += (stat.pass_ints[:"#text"].to_i * FANTASY_POINTS[:pass_ints])
    expected_production += (stat.rec_tds[:"#text"].to_i * FANTASY_POINTS[:rec_tds])
    expected_production += (stat.rec_yards[:"#text"].to_i * FANTASY_POINTS[:rec_yards])
    expected_production += (stat.receptions[:"#text"].to_i * FANTASY_POINTS[:receptions])
    expected_production += (stat.rush_tds[:"#text"].to_i * FANTASY_POINTS[:rush_tds])
    expected_production += (stat.rush_yards[:"#text"].to_i * FANTASY_POINTS[:rush_yards])
    expected_production += (stat.punt_ret_td[:"#text"].to_i * FANTASY_POINTS[:punt_ret_td])
    expected_production += (stat.kick_ret_td[:"#text"].to_i * FANTASY_POINTS[:kick_ret_td])
    expected_production += (stat.fum_lost[:"#text"].to_i * FANTASY_POINTS[:fum_lost])

    if (stat.pass_yards[:"#text"].to_i >= 300)
      expected_production += FANTASY_POINTS[:pass_yards_300]
    end
    
    if (stat.pass_yards[:"#text"].to_i >= 100)
      expected_production += FANTASY_POINTS[:rush_or_rec_yards_100]
    end
    
    if (stat.rush_yards[:"#text"].to_i >= 100)
      expected_production += FANTASY_POINTS[:rush_or_rec_yards_100]
    end
    
    expected_production
  end

end