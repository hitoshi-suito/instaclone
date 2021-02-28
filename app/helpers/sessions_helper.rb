module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end
end

# @user.id
# current_user.id => nil, undefined
#
# nil.id
#
#
# undefined method `id'
# id
#
# undefined method `id' for nil:NilClass
# nil.id
#
# undefined method `id' for UserClass
# user.id
#
# class User
#   id nothing
# end
