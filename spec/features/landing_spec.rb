require 'rails_helper'

RSpec.feature 'Visit landing page', type: :feature, js: true do
  scenario 'with root page not an authorized user' do
    visit '/'
    expect(page).to have_no_content I18n.t('hello1')
    expect(page).to have_no_content I18n.t('hello2')
  end
end