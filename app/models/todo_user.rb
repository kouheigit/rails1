class TodoUser < ApplicationRecord
  # パスワードのハッシュ化
  has_secure_password

  #バリデーション
  validates :name, presence: true
  validates :email presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }



end

