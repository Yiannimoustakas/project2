class CreateTestPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :test_pairs do |t|
      t.text :input
      t.text :output
      t.integer :challenge_id

      t.timestamps
    end
  end
end
