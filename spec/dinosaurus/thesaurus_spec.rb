require "spec_helper"

describe Dinosaurus::Thesaurus do
  subject { Dinosaurus::Thesaurus }

  it "should return results" do
    VCR.use_cassette('word') do
      results = subject.lookup('word')[:results]
      results["noun"]["syn"].should include("news")
    end
  end

  it "should return the lookup word" do
    VCR.use_cassette('word') do
      subject.lookup('word')[:text].should == 'word'
    end
  end

  it "should log errors" do
    subject.stub(:get) { stub(code: 500) }
    Logging.logger.should_receive(:warn)

    VCR.use_cassette('word') do
      subject.lookup('word')
    end
  end
end
