class Follow < ApplicationRecord
  # a follow belongs to two usrs: the follower (active), and the followed (passive). ActiveRecord knows from the name of the associatoin to use the 'follower_id' column (or teh 'followed_id' column), but it doesn't know what those are the IDs *for*, since there is no 'followers' of 'followeds' table. Acually, since both are IDs in the 'users' table, we tell it that using class_name: 'User'
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
