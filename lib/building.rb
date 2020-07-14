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

  def units_by_number_of_bedrooms
    bedroom_counts = @units.collect { |unit| unit.bedrooms }.uniq.sort.reverse

    result = Hash.new { |hash, bedroom_count| hash[bedroom_count] = [] }

    bedroom_counts.each do |count|
      @units.each do |unit|
        if unit.bedrooms == count
          result[count] << unit.number
        end
      end
    end
    result
  end

  def annual_breakdown
    renters = renters.map {|renter| renter.name}
    annual_rents = rented_units.map {|unit| unit.monthly_rent * 12}
    breakdown = {}

    renters.zip(annual_rents) { |renter, annual_rent| breakdown[renter] = annual_rent }
    
    breakdown
  end
end
