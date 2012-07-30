require "spec_helper"

describe Dinosaurus::Results do
  subject { Dinosaurus::Results }

  let(:noun) do
    { 'syn' => %w[syn1 syn2 syn3],
      'sim' => %w[sim1 sim2],
      'ant' => %w[ant1] }
  end

  let(:res) do
    {
      'noun' => noun,
      'verb' => {
        'rel' => %w[rel1 rel2 rel3],
        'syn' => %w[vsyn1]
      }
    }
  end

  it "should make synonyms available" do
    results = subject.new(res)
    results.synonyms.should == %w[syn1 syn2 syn3 vsyn1]
  end

  it "should make all antonyms available" do
    results = subject.new(res)
    results.antonyms.should == %w[ant1]
  end

  it "should make similar terms available" do
    results = subject.new(res)
    results.similar_terms.should == %w[sim1 sim2]
  end

  it "should make related terms available" do
    results = subject.new(res)
    results.related_terms.should == %w[rel1 rel2 rel3]
  end

  it "should make nouns available" do
    results = subject.new(res)
    results[:noun].should == noun
  end
end
