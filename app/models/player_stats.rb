class PlayerStats
  attr_reader :pass_yards, :pass_tds, :pass_ints, :rush_yards, :rush_tds,
              :receptions, :rec_yards, :fum_lost, :kick_ret_td, :punt_ret_td

  def initialize(attrs)
    @pass_yards  = attrs[:PassYards]
    @pass_tds    = attrs[:PassTD]
    @pass_ints   = attrs[:PassInt]
    @rush_yards  = attrs[:RushYards]
    @rush_tds    = attrs[:RushTD]
    @receptions  = attrs[:Receptions]
    @rec_yards   = attrs[:RecYards]
    @fum_lost    = attrs[:FumLost]
    @kick_ret_td = attrs[:KrTD]
    @punt_ret_td = attrs[:PrTD]
  end

end

# 300+ Passing Yards	3	0
# 100+ Yard Receiving Game	3	0
# 2 Point Conversion	2	2
# Sack	1	1
# Interception	2	2
# Fumble Recovery	2	2
# Safety	2	2
# Blocked Kick	2	2
# 0 Pts Allowed	10	10
# 1-6 Points Allowed	7	7
# 7-13 Pts Allowed	4	4
# 14-20 Pts Allowed	1	1
# 21-27 Pts Allowed	0	0
# 28-34 Pts Allowed	-1	-1
# 35+ Pts Allowed	-4	-4