Dir['../lib/*.rb'].each { |file| require file }

class MainApp
  attr_reader :path, :cars, :rentals, :results

  def initialize(path)
    @path = path
    @cars = []
    @rentals = []
    @results = []
  end

  def call
    load_objects
    compute_results
    generate_output
  end

  def load_objects
    input = Input.new(path)
    input.parsed_cars.each {|c| cars << Car.new(c)}
    input.parsed_rentals.each {|r| rentals << Rental.new(r.merge({"cars" => cars}))}
  end

  def generate_output
    Output.new(results).write
  end
end
