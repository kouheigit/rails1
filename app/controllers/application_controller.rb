class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Deviseコントローラーの場合のみ、許可するパラメータを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Deviseのストロングパラメータ設定
  # TodoUserモデルにnameカラムがある場合、これを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end

```ruby
<?php

namespace App\Http\Requests\Auth;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class RegisteredUserRequest extends FormRequest
{
    /**
     * リクエストの認可を決定
     */
    public function authorize(): bool
    {
        return true; // 登録は誰でも可能
    }

    /**
     * バリデーションルール
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', Password::defaults()],
        ];
    }
}
```
