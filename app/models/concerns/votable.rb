require 'active_support/concern'

module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def total_votes
    votes.where(vote_status: true).count - votes.where(vote_status: false).count
  end
end
