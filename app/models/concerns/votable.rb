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

    Vote.find_by_voter_id voter_id
  end

  def downvote(voter_id:)
    votes.create voter_id: voter_id, vote_status: false if vote(voter_id)
    Vote.find_by_voter_id voter_id
  end

  private
  def vote(voter_id)
    vote = Vote.find_by_voter_id voter_id

    unless vote.nil?
      Vote.delete vote.id
      return false
    end
    true
  end
end
