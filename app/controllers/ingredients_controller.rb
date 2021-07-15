# frozen_string_literal: true

class IngredientsController < ApplicationController
  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end
end
