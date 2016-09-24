# class RegistrationForm
#   include ActiveModel::Model
#   include ActiveModel::Validations
#   include ActiveModel::Conversion
#   extend ActiveModel::Naming
#
#   attr_accessor :email, :password, :password_confirmation
# 
#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
#   validates :email, presence: true, length: { maximum: 255 },
#                     format: { with: VALID_EMAIL_REGEX }
#
#   validates :password, length: { minimum: 6 }, allow_blank: true
#
#
#   def registration
#     @registration ||= Registration.new
#   end
#
#   def submit(params)
#
#     binding.pry
#
#     return false unless params
#
#     registration.email    = params[:email]
#     registration.password = params[:password]
#     registration.password_confirmation = params[:password_confirmation]
#
#     if valid?
#       registration.save!
#       true
#     else
#       false
#     end
#   end
#
#
#   def verify_unique_email
#     if Registration.exists? email: email
#       errors.add :email, "has already been taken"
#     end
#   end
# end
