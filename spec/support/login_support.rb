module LoginSupport
  
  def login_as(user, remember_me)
    fill_in "User Name", with: user.name
    fill_in "Password", with: user.password
    if remember_me == true
      page.check("session_remember_me")
    else
      page.uncheck("session_remember_me")
    end
    click_button "Login"
  end
  
  def post_login_as(user, remember_me)
    post login_path, session: {
      name: user.name,
      password: user.password,
      remember_me: remember_me,
     }
  end
end