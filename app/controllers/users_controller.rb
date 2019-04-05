class UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    @user = UserPresenter.new(
      UserDecorator.new(user)
    )
  end
end
