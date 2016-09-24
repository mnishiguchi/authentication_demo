class User < ApplicationRecord
  has_one :registration, as: :registrable, validate: true

  # Ensure that this user has already been registered.
  validate do |user|
    unless user.registration
      user.errors[:base] << "User must be registered"
    end
  end

  include Registrable

end
