class TodoPriority < ApplicationRecord
  #バリデーション
  validates :name, presence: true, uniqueness: true
  validates :label, presence: true

  #リレーション
  has_many :todo_tasks, dependent: :destroy

  # ソート順で並び替え
  scope :ordered, -> { order(:sort_order) }
end