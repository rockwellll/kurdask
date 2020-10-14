class UpVoteController < ApplicationController
  include AuthenticationHelper

  before_action :authenticate
  before_action :set_entity
  before_action :is_owner?

  def store
    result = @target.upvote voter_id: current_user.id

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

  def is_owner?
    if @target.user.id == current_user.id
      render json: {
          success: false,
          message: t('errors.banner.you_cant_vote_for_yourself')
      }
      return
    end
  end
end
