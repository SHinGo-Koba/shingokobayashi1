class Ticket
  
  attr_reader :fare, :stampred_at
  
  def initialize(fare)
    @fare = fare
  end
  
  def stamp(name)
    @stampred_at = name
  end
  
end