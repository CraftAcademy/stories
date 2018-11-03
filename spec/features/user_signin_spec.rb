
feature 'User signs in' do
  scenario 'successfully', js: true do
    user = create(:user, username: 'exampleuser')
    sign_in user
    visit root_path
    expect(page).to have_css 'a', text: 'Logga ut', visible: false
    expect(page).to have_css 'a', text: 'Nytt inlägg', visible: false
    expect(current_path).to eq(root_path)
  end

  scenario 'admin user cannot go to log in page', js: true do
    admin = Admin.create!(email: 'admin@email.com', password: 'password')
    # Log in as an Admin first.
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Lösenord', with: admin.password
    click_on 'Logga in'

    visit new_user_session_path
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content 'Please sign out of admin session'
  end
end
