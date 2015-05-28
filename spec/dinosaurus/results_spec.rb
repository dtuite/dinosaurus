require "spec_helper"

describe Dinosaurus::Results do
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

  subject { described_class.new(res) }

  it "makes synonyms available" do
    expect(subject.synonyms).to eq(%w[syn1 syn2 syn3 vsyn1])
  end

  it "makes all antonyms available" do
    expect(subject.antonyms).to eq(%w[ant1])
  end

  it "makes similar terms available" do
    expect(subject.similar_terms).to eq(%w[sim1 sim2])
  end

  it "makes related terms available" do
    expect(subject.related_terms).to eq(%w[rel1 rel2 rel3])
  end

  it "makes nouns available" do
    expect(subject[:noun]).to eq(noun)
  end
end
