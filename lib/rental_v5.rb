require_relative 'rental_v3.rb'

class RentalV5 < RentalV4
  def options
    Option.all.select {|o| o.rental_id == @id}.map(&:type)
  end

  def owner
    (general_owner_price + gps_price + baby_seat_price).round
  end

  def general_owner_price
    price * 0.7
  end

  def gps_price
    options.include?("gps") ? (duration * 500) : 0
  end

  def baby_seat_price
    options.include?("baby_seat") ? (duration * 200) : 0
  end

  def additional_insurance_price
    options.include?("additional_insurance") ? (duration * 1000) : 0
  end

  def drivy
    (additional_insurance_price + commission - (insurance + roadside_assistance)).round
  end

  def driver
    price + options_price
  end

  def options_price
    gps_price + baby_seat_price + additional_insurance_price
  end
end
