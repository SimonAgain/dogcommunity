class User < ApplicationRecord
  
  has_many :owned_dogs, class_name: 'Dog', foreign_key: 'owner_id'
  has_and_belongs_to_many :walked_dogs, class_name: 'Dog'


  has_secure_password

  enum user_type: [:owner, :walker]

  validates :name, length: { minimum: 2}

  validates :email, presence: true, uniqueness: true

  ## other end of the belongs_to :followed, in class Follow.

#foreign_key here tells AR where to look in the 'follows' table to find this relationship, ie. look in the column called 'follower_id', which should have the ID of the current user to find out what the user is followING;

#if we don't specify the foreign_key here, it wil default to trying to user the singular form of the name of the association ('following_relationship_id') as the ID column, which is wrong.
  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy# we're stating both the class name and the column in the table.

  has_many :followed_relationship, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy

  #.. the above associations give us eg.
  # User.first.following_relationships
  # which returns an array of Follow objects ... NOT user objects!
  # to fix that:

  has_many :following, through: 'followed_relationship', source: 'follower'
  # The 'source' here is telling AR, "to find the other users that this user is following", you need to look in the 'followed_id' field of the follow object in the '.following_relationships' association above.

  has_many :followers, through: 'followed_relationships', source: 'follower'

end
