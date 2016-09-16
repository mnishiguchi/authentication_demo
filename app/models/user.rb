class User < ApplicationRecord
  has_one :registration, as: :registrable

  include Registrable
end
