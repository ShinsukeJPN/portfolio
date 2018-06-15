class UserArea < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :area, optional: true
end
