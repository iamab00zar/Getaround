require_relative '../lib/main_app.rb'

class Main < MainApp

  private

  def compute_results
    rentals.each do |r|
      results.push(
        {
              'id'    => r.id,
              'price' => r.price
        }
      )
    end
  end
end

Main.new("data/input.json").call
