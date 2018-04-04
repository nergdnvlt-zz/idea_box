class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == 'sessions'
    return true if controller == 'users'
    return true if controller == 'welcome'
    if user
      return true if user.admin?
      return true if controller == 'ideas'
      return true if controller == 'categories' && action.in?(%w[index show])
      return true if controller == 'images' && action.in?(%w[index show])
    end
    false
  end
end
