# frozen_string_literal: true

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
    before_action :load_current_user
  end

  def logged_in_using_omniauth?
    redirect_to :root if session[:userinfo].blank?
  end

  def load_current_user
    uid = session[:userinfo]["uid"]
    return if uid.blank?
    @current_user = User.find_by!(uid: uid)
  end
end
