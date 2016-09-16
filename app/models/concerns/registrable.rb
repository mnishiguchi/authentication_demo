require 'active_support/concern'

# The Registrable module is a set of utility methods that is designed to
# be included into a Registrable model.
module Registrable
  extend ActiveSupport::Concern

  included do  # Instance methods

  end

  class_methods do

    def find_all_liked_by(user)
    end
  end
end
