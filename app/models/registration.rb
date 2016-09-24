class Registration < ApplicationRecord
  belongs_to :registrable, polymorphic: true

  before_save   :downcase_email  # Standardizes on all lower-case addresses.

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password  # Incl. presence and matching validations.
  validates :password, length: { minimum: 6 }, allow_blank: true


  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end
end
