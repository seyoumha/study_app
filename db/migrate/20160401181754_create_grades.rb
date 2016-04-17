class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :score
      t.integer :user_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end