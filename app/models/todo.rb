class Todo < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :user_id, presence: true

  # リレーション
  belongs_to :user

  # スコープ
  scope :recent, -> { order(created_at: :desc) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }

```ruby
end
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    // バリデーション
    // validates :title, presence: true
    // validates :user_id, presence: true

    // リレーション
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // スコープ
    public function scopeRecent($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function scopeByUser($query, $userId)
    {
        return $query->where('user_id', $userId);
    }
}
```