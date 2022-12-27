class UsersController < ApplicationController
  def all
    @users = User.all
  end

  def delete
    User.find_by_id(params[:id]).destroy
  end
end
