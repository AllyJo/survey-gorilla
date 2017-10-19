class CreateResponsesTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :survey_taker_id, null: false
      t.integer :choice_id, null: false

      t.timestamps
    end
  end
end
