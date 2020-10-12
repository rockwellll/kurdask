class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.boolean :vote_status, null: false
      t.references :votable, polymorphic: true
      t.references :voter, null: false, foreign_key: {to_table: 'users'}
    end
    add_index :votes, [:votable_id, :votable_type, :voter_id], unique: true
  end
end
