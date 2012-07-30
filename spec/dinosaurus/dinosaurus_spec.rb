require "spec_helper"

describe Dinosaurus do
  let(:res) {  Dinosaurus::Results.new  }
  before do
    Dinosaurus.stub(:lookup) { res }
  end

  describe "synonyms_of" do
    it "should return synonyms" do
      res.should_receive(:synonyms)
      Dinosaurus.synonyms_of('normal')
    end
  end

  describe "antonyms_of" do
    it "should return antonyms" do
      res.should_receive(:antonyms)
      Dinosaurus.antonyms_of('normal')
    end
  end

  describe "related_to" do
    it "should return related terms" do
      res.should_receive(:related_terms)
      Dinosaurus.related_to('normal')
    end
  end

  describe "similar_to" do
    it "should return similar terms" do
      res.should_receive(:similar_terms)
      Dinosaurus.similar_to('normal')
    end
  end
end
