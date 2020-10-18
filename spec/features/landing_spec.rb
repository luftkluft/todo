require 'rails_helper'

RSpec.feature 'Visit landing page', type: :feature, js: true do
  scenario 'with root page not an authorized user' do
    visit '/'
    expect(page).to have_content ('Welcome to the TODO app!')
  end
end