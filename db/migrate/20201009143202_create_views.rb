class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.references :question, allow_null: false, foreign_key: true
      t.references :viewer, allow_null: false, foreign_key: {to_table: 'users'}
    end

    add_index :views, [:question_id, :viewer_id], unique: true
  end
end