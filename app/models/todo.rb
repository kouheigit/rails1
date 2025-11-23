class Todo < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :user_id, presence: true

  # リレーション
  belongs_to :user

  # スコープ
  scope :recent, -> { order(created_at: :desc) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
end
