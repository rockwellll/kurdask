require 'active_support/concern'

module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def total_votes
    votes.where(vote_status: true).count - votes.where(vote_status: false).count
  end

  def upvote(voter_id:)
    return votes.create voter_id: voter_id, vote_status: true if vote(voter_id)
  end

  def downvote(voter_id:)
    votes.create voter_id: voter_id, vote_status: false if vote(voter_id)
  end
  
  private
  def vote(voter_id)
    vote = votes.where(voter_id: voter_id)
    return true if votes.empty?

    Vote.delete vote[0].id unless vote[0].nil?
    false
  end
end
