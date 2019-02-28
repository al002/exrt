RSpec.describe Exrt do
  it "latest exchange rates has correct base symbol" do
    result = Exrt::Rate.latest(base: 'EUR');
    expect(result['base']).to eq('EUR')
  end

  it "latest exchange rates has correspondent symbols" do
    result = Exrt::Rate.latest(symbols: %w[CNY]);
    expect(result['rates'].has_key? 'CNY').to eq(true)
  end

  it "historical exchange rates has correct start date" do
    result = Exrt::Rate.history(start_at: '2019-02-20', end_at: '2019-02-27', symbols: %w[CNY]);
    expect(result['start_at']).to eq('2019-02-20')
  end

  it "historical exchange rates has correct end date" do
    result = Exrt::Rate.history(start_at: '2019-02-20', end_at: '2019-02-27', symbols: %w[CNY]);
    expect(result['end_at']).to eq('2019-02-27')
  end


  it "latest exchange rates has rates field" do
    result = Exrt::Rate.latest(symbols: %w[CNY]);
    expect(result.has_key? 'rates').to eq(true)
  end
end
