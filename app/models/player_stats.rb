class PlayerStats
  attr_reader :pass_yards, :pass_tds, :pass_ints, :rush_yards, :rush_tds,
              :receptions, :rec_yards, :fum_lost, :kick_ret_td, :punt_ret_td,
              :rec_tds

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

end