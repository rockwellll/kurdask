class DownvoteController < ApplicationController
  include AuthenticationHelper

  before_action :authenticate
  before_action :set_entity

  def store
    result = @target.downvote(voter_id: current_user.id)

    if !result.nil?
      render json: {
          success: true,
          toggle: true,
          count: @target.total_votes
      }
    else
      render json: {
          success: true,
          toggle: false,
          count: @target.total_votes
      }
    end
  end

  private
  def set_entity
    @target = params[:entityType].constantize.find params[:entityId]
  end
end
