class Registration < ApplicationRecord
  belongs_to :registrable, polymorphic: true
end
