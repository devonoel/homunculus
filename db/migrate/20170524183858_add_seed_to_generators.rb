class AddSeedToGenerators < ActiveRecord::Migration[5.0]
  def change
    add_column :generators, :seed, :string, array: true
  end
end
