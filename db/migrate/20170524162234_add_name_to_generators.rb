class AddNameToGenerators < ActiveRecord::Migration[5.0]
  def change
    add_column :generators, :name, :string
  end
end
