class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true
      t.references :viewer, null: false, foreign_key: {to_table: 'users'}
    end
    add_index :views, [:viewable_id, :viewable_type, :viewer_id], unique: true
  end
end