require_relative 'rental_v3.rb'

class RentalV4 < RentalV3
  def owner
    (price * 0.7).round
  end
end
