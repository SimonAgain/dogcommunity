class Photo < ApplicationRecord
  belongs_to :dogs, optional: true
end
