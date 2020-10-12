class Vote < ApplicationRecord
  belongs_to :user, foreign_key: 'viewer_id', optional: true
  belongs_to :votable, polymorphic: true
end
