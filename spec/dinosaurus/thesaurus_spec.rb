require "spec_helper"

describe Dinosaurus::Thesaurus do
  it "should return results" do
    VCR.use_cassette('word') do
      expect(described_class.lookup('word')).to be_instance_of(Dinosaurus::Results)
    end
  end

  it "should log errors" do
    allow(described_class).to receive(:get).and_return(double(code: 500))
    allow(Logging.logger).to receive(:warn)
    VCR.use_cassette('word') { described_class.lookup('word') }
    expect(Logging.logger).to have_received(:warn)
  end

  it "should return {} for nonsense words" do
    VCR.use_cassette('nonsense') do
      expect(described_class.lookup('hsdfkjhsf')).to eq({})
    end
  end

  it "should handle two words" do
    VCR.use_cassette('meal_people') do
      expect(described_class.lookup('meal people')).to eq({})
    end
  end

  it "should raise up if missing api key" do
    allow(Dinosaurus.configuration).to receive(:api_key)
    expect do
      described_class.lookup('word')
    end.to raise_error(Dinosaurus::MissingApiKeyError)
  end

  it "should raise if the server 500"
end
