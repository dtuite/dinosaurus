require "spec_helper"

describe Dinosaurus do
  let(:res) {  Dinosaurus::Results.new  }
  before { allow(Dinosaurus).to receive(:lookup).and_return(res) }

  describe "#synonyms_of" do
    it "should return synonyms" do
      allow(res).to receive(:synonyms)
      Dinosaurus.synonyms_of('normal')
      expect(res).to have_received(:synonyms)
    end
  end

  describe "#antonyms_of" do
    it "should return antonyms" do
      allow(res).to receive(:antonyms)
      Dinosaurus.antonyms_of('normal')
      expect(res).to have_received(:antonyms)
    end
  end

  describe "#related_to" do
    it "should return related terms" do
      allow(res).to receive(:related_terms)
      Dinosaurus.related_to('normal')
      expect(res).to have_received(:related_terms)
    end
  end

  describe "#similar_to" do
    it "should return similar terms" do
      allow(res).to receive(:similar_terms)
      Dinosaurus.similar_to('normal')
      expect(res).to have_received(:similar_terms)
    end
  end
end
