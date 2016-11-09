class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :new_message
  before_action :new_issue
  before_action :set_locale

  def default_url_options(options={})
    if I18n.locale != I18n.default_locale
      { :locale => I18n.locale }
    else
      { :locale => I18n.default_locale }
    end
  end

  protected

    def set_locale
      # if params[:locale] is nil then I18n.default_locale will be used
      I18n.locale = params[:locale] ||= I18n.default_locale
    end

    def new_message
      @message = Message.new
    end

    def new_issue
      @ad_issue = AdIssue.new
    end
end
