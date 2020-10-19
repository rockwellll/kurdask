require 'active_support/concern'

module Viewable
  extend ActiveSupport::Concern

  included do
    has_many :views, as: :viewable
  end
end
