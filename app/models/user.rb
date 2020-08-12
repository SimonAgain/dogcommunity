class User < ApplicationRecord
  has_and_belongs_to_many :dogs

  has_secure_password

  enum user_type: [:owner, :walker]

  validates :name, length: { minimum: 2}

  validates :email, presence: true, uniqueness: true
end
