class RenameChainsToGenerators < ActiveRecord::Migration[5.0]
  def change
    rename_table :chains, :generators
  end
end
