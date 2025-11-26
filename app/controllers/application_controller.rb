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
