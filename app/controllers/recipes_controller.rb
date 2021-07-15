# frozen_string_literal: true

class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
  end
end
