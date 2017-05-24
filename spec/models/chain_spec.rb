require 'rails_helper'

describe Chain, type: :model do
  describe "#generate_table!" do
    let(:user) { create(:user) }
    let(:chain) { create(:chain, user: user) }
    context "when given an array of names" do
      it "generates a non-empty table" do
        chain.generate_table!(["Bob", "Joe"])
        expect(chain.table).not_to be_empty
      end
    end

    context "when not given an array" do
      it "raises a TypeError" do
        expect {chain.generate_table!("")}.to raise_error(TypeError)
      end
    end
  end

  describe "#generate_name" do
    let(:user) { create(:user) }

    context "when table is empty" do
      let(:chain) { create(:chain, table: {}, user: user) }
      it "returns nil" do
        expect(chain.generate_name).to be_nil
      end
    end

    context "when table is not empty" do
      let(:chain) { create(:chain,
        table: {"b"=>{"o"=>1}, "o"=>{"b"=>1, "e"=>1}, "j"=>{"o"=>1}},
        user: user) }
      it "returns a string" do
        expect(chain.generate_name).to be_a(String)
      end
    end
  end
end
