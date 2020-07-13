class Scene < ApplicationRecord
  belongs_to :script
  has_rich_text :body
end
