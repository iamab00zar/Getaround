require_relative '../lib/output.rb'

describe Output do
  it 'check if the output and expected one are the same' do
    f1 = JSON.parse(File.read('../level3/data/expected_output.json'))
    f2 = JSON.parse(File.read('../level3/data/output.json'))

    expect(f1["rentals"]).to eq(f2["rentals"])
  end
end

