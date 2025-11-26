class TodoUsersController < ApplicationController
 skip_before_action :require_todo_user_login, only: [:new, :create]

end


