class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :body, null: false
      t.integer :survey_id, null: false

      t.timestamps
    end
  end
end
