class Player
  attr_reader :id, :last_name, :first_name, :position
  attr_accessor :stats

  def initialize(attrs)
    @id         = attrs[:ID]
    @last_name  = attrs[:LastName]
    @first_name = attrs[:FirstName]
    @position   = attrs[:Position]
    @stats = []
  end

end