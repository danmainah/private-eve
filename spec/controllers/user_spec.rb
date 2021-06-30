require 'rails_helper'

describe 'Controller', type: :system do
  describe 'Create new user' do
    it 'should not create user without email' do
      visit new_user_registration_path
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'
      sleep(5)
      expect(page).to have_content("Email can't be blank")
    end

    it 'should not create user without password confirmation' do
      visit new_user_registration_path
      fill_in 'Email', with: 'medawg@vv.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '12346'
      click_button 'Sign up'
      sleep(5)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
