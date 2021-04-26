require 'rails_helper'

RSpec.describe 'Different features', type: :system do
    before do
        driven_by(:rack_test)
    end

    it 'Creates user' do
        visit root_path
        click_link_or_button 'Sign up'
        fill_in 'user[name]', with: 'Greg'
        fill_in 'user[email]', with: 'test@test.me'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        click_link_or_button 'Sign up'
        expect(current_path).to eq(root_path)
    end

    it 'Creates post' do
        user = User.create(name: 'Greg', email: 'test@test.me', password: '123456')
        visit root_path
        click_link_or_button 'Sign in'
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        fill_in 'post[content]', with: 'This is a test'
        click_link_or_button 'Save'
        visit root_path
        expect(page).to have_text('This is a test')
    end
end