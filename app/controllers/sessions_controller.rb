class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user_info = request.env['omniauth.auth']
    uid = user_info&.uid
    @user = User.find_or_create_by(uid:)
    if @user.persisted?
      session[:user_id] = @user.uid
      render_status 200, {uid: @user.uid}
    else
      render_status 404
    end
  end

  def delete
    session[:user_id] = nil
    render_status 201
  end
end
