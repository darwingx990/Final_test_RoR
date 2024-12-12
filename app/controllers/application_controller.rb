class ApplicationController < ActionController::Base
  before_action :set_locale

  config.i18n.set_locale = :es
  config.i18n.available_locales = [ :en, :es ]
  config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
