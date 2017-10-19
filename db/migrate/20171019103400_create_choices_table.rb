class CreateChoicesTable < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :body, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
