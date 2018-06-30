class LandingController < ApplicationController
  before_action :set_user_locale

  def landing

  end

  def change_locale
    begin
      locale = params[:locale]
      if locale == ''
        locale = 'en'
      end
      raise 'unsupported locale' unless ['ru', 'en'].include?(locale)
      User.find(current_user.id).update_attribute(:locale, locale) if current_user && !current_user.blank?
      I18n.locale = locale
      render :landing
    rescue
      print "raise 'unsupported locale'_error"
      I18n.locale = 'en'
    end
  end

  private
  
  def set_user_locale
    begin
      print "set_current_user.locale"
      user = User.find(current_user.id)
      I18n.locale = user.locale
    rescue
      print "current_user.locale_not_found"
      locale = params[:locale]
      I18n.locale = locale
      change_locale
    end
  end
end
