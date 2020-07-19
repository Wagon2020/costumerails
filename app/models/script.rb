class Script < ApplicationRecord
  belongs_to :user
  has_many :scenes
  has_many :roles
end
