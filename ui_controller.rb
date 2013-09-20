class UiController < ApplicationController
  layout :choose_layout

  skip_before_filter :ensure_authentication

  private
  def choose_layout
    case action_name
    when /^_/
      false
    when /^session/
      'ui_session'
    else
      'ui_application'
    end
  end
end
