require 'rails_helper'

describe Generator, type: :model do
  it "requires a name" do
    expect(build(:generator, name: nil)).to_not be_valid
  end

  it "requires a seed" do
    expect(build(:generator, seed: nil)).to_not be_valid
  end

  describe "#generate_table!" do
    let(:user) { create(:user) }
    let(:generator) { create(:generator, user: user) }
    it "generates a non-empty table" do
      generator.generate_table!
      expect(generator.table).not_to be_empty
    end
  end

  describe "#generate_name" do
    let(:user) { create(:user) }
    let(:generator) { create(:generator, user: user) }
    it "returns a string" do
      expect(generator.generate_name).to be_a(String)
    end
  end
end
