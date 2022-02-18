Dir['../lib/*.rb'].each { |file| require file }

class Main < MainApp

  private

  def load_objects
    input = Input.new(path)
    input.parsed_cars.each {|c| cars << Car.new(c)}
    input.parsed_rentals.each {|r| rentals << RentalV4.new(r.merge({"cars" => cars}))}
  end

  def compute_results

    rentals.each { |r| results.push(
      {
        "id"=> r.id,
        "actions" => [
          {"who" => "driver", "type" => "debit", "amount" => r.price},
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
