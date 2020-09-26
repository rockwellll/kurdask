class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :question, null: false, foreign_key: true
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
