require 'json'

class Input
  attr_reader :data

  def initialize(path)
    @data = JSON.parse(File.read(path))
  end

  def parsed_cars
    data['cars']
  end

  def parsed_rentals
    data['rentals']
  end
end
