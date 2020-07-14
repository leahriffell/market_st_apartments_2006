class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map {|unit| unit.renter}.compact
  end

  def average_rent
   rents = @units.map {|unit| unit.monthly_rent}
   rents.sum.to_f / rents.length
  end

  def rented_units
    @units.select {|unit| unit.renter != nil}
  end
end
