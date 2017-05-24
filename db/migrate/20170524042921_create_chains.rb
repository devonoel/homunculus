class CreateChains < ActiveRecord::Migration[5.0]
  def change
    create_table :chains do |t|
      t.json :table
      t.integer :user_id

      t.timestamps
    end
  end
end
