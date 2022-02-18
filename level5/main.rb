Dir['../lib/*.rb'].each { |file| require file }

class Main < MainApp

  private

  def load_objects
    input = Input.new(path)
    input.parsed_cars.each {|c| cars << Car.new(c)}
    input.data['options'].each {|o| Option.new(o)}
    input.parsed_rentals.each {|r| rentals << RentalV5.new(r.merge({"cars" => cars}))}
  end

  def compute_results
    rentals.each { |r| results.push(
      {
        "id"=> r.id,
        "options" => r.options,
        "actions" => [
          {"who" => "driver", "type" => "debit", "amount" => r.driver},
          {"who" => "owner", "type" => "credit", "amount" => r.owner},
          {"who" => "insurance", "type" => "credit", "amount" => r.insurance},
          {"who" => "assistance", "type" => "credit", "amount" => r.roadside_assistance},
          {"who" => "drivy", "type" => "credit", "amount" => r.drivy}
        ]
      })
    }
  end
end

Main.new("data/input.json").call
