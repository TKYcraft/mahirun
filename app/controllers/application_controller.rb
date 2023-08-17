class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    !!current_user
  end

  def render_status _status=500, _data={}, _messages=[]
    # guard
    raise ArgumentError unless _messages.class == Array
    raise ArgumentError unless _status.class == Integer

    render status: _status, json: {
      status: _status,
      status_message: message_of(_status),
      data: _data.as_json,
      messages: _messages
    }
  end

  def message_of _status=500
    # Can not use hash cuz Can not use Integer as key of hash !!

    # guard
    raise ArgumentError unless _status.class == Integer

    case _status
    when 200 then
      return "OK"
    when 201 then
      return "Created"
    when 400 then
      return "Bad Request"
    when 401 then
      return "Unauthorized"
    when 403 then
      return "Forbidden"
    when 404 then
      return "Not Found"
    when 409 then
      return "Conflict"
    when 418 then
      return "I'm a teapot"
    when 500 then
      return "Internal Server Error"
    else
      raise NotImplementedError
    end
  end
end
