class Dog < ApplicationRecord
  has_and_belongs_to_many :walked_by_users, class_name: 'User'
  has_many :photos
  belongs_to :owner, class_name: 'User', optional: true

end
