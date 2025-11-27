class TodoUsersController < ApplicationController

  skip_before_action :require_todo_user_login, only: [:new, :create]

  def new

    @todo_user = TodoUser.new

  end

  def create

    @todo_user = TodoUser.new(todo_user_params)

    if @todo_user.save

      session[:todo_user_id] = @todo_user.id

      redirect_to todo_tasks_path, notice: '登録が完了しました'

    else

      render :new, status: :unprocessable_entity

    end

  end

  private

  def todo_user_params

    params.require(:todo_user).permit(:name, :email, :password, :password_confirmation)

  end

end

