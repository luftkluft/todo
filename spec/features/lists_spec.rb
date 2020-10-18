require 'rails_helper'

RSpec.feature 'Lists Feature', type: :feature, js: true do
  def sign_up
    visit '/users/sign_up'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[first_name]', with: 'Name'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    page.find_button('Sign up').click
  end

  def sign_out
    page.find('#account-dropdown').click
    page.find('#link-sign-out').click
  end

  def create_new_list
    page.find('#add_list').click
    fill_in 'list[title_list]', with: 'List 1'
    page.find_button('New list').click
  end

  before do
    sign_up
    sign_out
    visit '/users/sign_in'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    page.find_button('Log in').click
  end

  scenario 'add new List' do
    expect(page).to have_content ('You do not have any todo lists')
    page.find('#add_list').click
    expect(page).to have_content ('New list')
    fill_in 'list[title_list]', with: 'List 1'
    page.find_button('New list').click
    expect(page).to have_content ('List 1')
    expect(page).to have_no_content ('You do not have any todo lists')
  end
end
