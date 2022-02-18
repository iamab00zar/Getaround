Dir['../lib/*.rb'].each { |file| require file }

class Main < MainApp

  private

  def load_objects
    input = Input.new(path)
    input.parsed_cars.each {|c| cars << Car.new(c)}
    input.parsed_rentals.each {|r| rentals << RentalV3.new(r.merge({"cars" => cars}))}
  end

  def compute_results
    rentals.each do |r|
      results.push(
        {
          'id'    => r.id,
          'price' => r.price,
          'commission' => {
            'insurance_fee' => r.insurance,
            'assistance_fee' => r.roadside_assistance,
            'drivy_fee' => r.drivy
          }
        }
      )
    end
  end
end

Main.new("data/input.json").call
