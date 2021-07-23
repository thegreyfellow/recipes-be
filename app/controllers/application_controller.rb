# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::UnknownFormat, with: :raise_not_found

  def raise_not_found
    render(text: 'Not Found', status: :not_found)
  end
end
