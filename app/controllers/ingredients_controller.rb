# frozen_string_literal: true

class IngredientsController < ApplicationController
  include Pagy::Backend

  # GET /ingredients
  def index
    @pagy, @ingredients = pagy(Ingredient.all, items: params[:per_page], page: params[:page])
  end
end
