class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :pictures, source: :picture, foregn_key: :picture_id,
end
