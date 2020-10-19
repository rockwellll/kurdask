class View < ApplicationRecord
  belongs_to :user, foreign_key: 'viewer_id', optional: true
  belongs_to :viewable, polymorphic: true
end
