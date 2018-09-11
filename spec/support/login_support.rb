module LoginSupport
  def login_as(user)
    visit root_path
    find("div.header-pc").find_link("Login").click
    fill_in "User Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Login"
  end
end