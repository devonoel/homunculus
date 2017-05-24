require 'rails_helper'

describe Generator, type: :model do
  describe "#generate_table!" do
    let(:user) { create(:user) }
    let(:generator) { create(:generator, user: user) }
    context "when given an array of names" do
      it "generates a non-empty table" do
        generator.generate_table!(["Bob", "Joe"])
        expect(generator.table).not_to be_empty
      end
    end

    context "when not given an array" do
      it "raises a TypeError" do
        expect {generator.generate_table!("")}.to raise_error(TypeError)
      end
    end
  end

  describe "#generate_name" do
    let(:user) { create(:user) }

    context "when table is empty" do
      let(:generator) { create(:generator, table: {}, user: user) }
      it "returns nil" do
        expect(generator.generate_name).to be_nil
      end
    end

    context "when table is not empty" do
      let(:generator) { create(:generator,
        table: {"b"=>{"o"=>1}, "o"=>{"b"=>1, "e"=>1}, "j"=>{"o"=>1}},
        user: user) }
      it "returns a string" do
        expect(generator.generate_name).to be_a(String)
      end
    end
  end
end
