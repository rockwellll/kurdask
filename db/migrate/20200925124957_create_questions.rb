class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.index :title
      t.integer :views, default: 0

      t.timestamps
    end
  end
end
