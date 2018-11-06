class CreateTestPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :test_pairs do |t|
      t.string  :input
      t.string  :output
      t.integer :test_pair_type
      t.integer :challenge_id

      t.timestamps
    end
  end
end
