class User < ApplicationRecord
  has_and_belongs_to_many :dogs

  has_secure_password

  enum user_type: [:owner, :walker]
end
