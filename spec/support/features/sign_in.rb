module Features
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Lösenord', with: user.password
    click_on 'Logga in'
  end

  def sign_in_a_user
    user = create(:user, username: 'exampleuser', email: 'example@user.com',
                  password: 'mypassword')
    sign_in user
  end
end
