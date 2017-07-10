class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :content, presence: true

  scope :recent, -> { order("created_at DESC")}
  scope :back_recent, -> { order("created_at DESC").reverse}
end
