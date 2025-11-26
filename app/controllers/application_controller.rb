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
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 現在のTodoUserを取得
  def current_todo_user
    @current_todo_user ||= TodoUser.find(session[:todo_user_id]) if session[:todo_user_id]
  end
  helper_method :current_todo_user

  # ログインしているかチェック
  def todo_user_logged_in?
    !!current_todo_user
  end
  helper_method :todo_user_logged_in?

  # ログイン必須のアクション
  def require_todo_user_login
    unless todo_user_logged_in?
      redirect_to todo_login_path, alert: 'ログインが必要です'
    end
  end
end
```

