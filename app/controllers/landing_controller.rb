class LandingController < ApplicationController
  before_action :set_user_locale

  def landing; end

  def change_locale
    locale = params[:locale]
    locale = 'en' if locale == ''
    raise 'unsupported locale' unless %w[ru en].include?(locale)

    User.find(current_user.id).update_attribute(:locale, locale) if current_user && !current_user.blank?
    I18n.locale = locale
    render :landing
  rescue StandardError
    print "raise 'unsupported locale'_error"
    I18n.locale = 'en'
  end

  private

  def set_user_locale
    print 'set_current_user.locale'
    user = User.find(current_user.id)
    I18n.locale = user.locale
  rescue StandardError
    print 'current_user.locale_not_found'
    locale = params[:locale]
    I18n.locale = locale
    change_locale
  end
end
