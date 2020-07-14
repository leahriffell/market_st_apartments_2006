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

  def renter_with_highest_rent
    occupied_rents = rented_units.map {|unit| unit.monthly_rent}

    highest_rent_unit = @units.find {|unit| unit.monthly_rent == occupied_rents.max}

    highest_rent_unit.renter
  end
end
