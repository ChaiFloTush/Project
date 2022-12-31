# frozen_string_literal: true

# controller for comments
class UsersController < ApplicationController
  def all
    redirect_to root_path if current_user.name != 'Admin'
    @users = User.all
  end

  def delete
    User.find_by_id(params[:id]).destroy
  end
end
