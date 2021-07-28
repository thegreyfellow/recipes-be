# frozen_string_literal: true

class RecipesController < ApplicationController
  # GET /recipes
  def index
    limit, page, offset, people_quantity, difficulty = initialize_parameters
    query = build_query(people_quantity, difficulty, limit, offset)

    @recipes = query
    @pagination = {
      items: limit,
      next: (page >= 1 ? page : 1) + 1
    }
  end

  private

  def initialize_parameters
    limit = params[:per_page].to_i
    page = params[:page].to_i
    offset = [page - 1, 0].max * limit
    ingredients = params[:ingredients] || []

    @ingredients_with_percetage_signs = ingredients.map { |val| "%#{val}%" }

    [limit, page, offset, params[:quantity], params[:difficulty], ingredients]
  end

  def build_query(people_quantity, difficulty, limit, offset)
    query = Recipe.joins(:ingredients)
    query = query.where(people_quantity: people_quantity) if people_quantity.present?
    query = query.where(difficulty: difficulty) if difficulty.present?
    build_ingredients_query(query, limit, offset)
  end

  def build_ingredients_query(query, limit, offset)
    if @ingredients_with_percetage_signs.empty?
      query.limit(limit)
           .offset(offset)
    else
      query
        .where(
          'ingredients.name ILIKE ANY ( array[?] )',
          @ingredients_with_percetage_signs
        ).group(:id)
        .order('count(recipes.id) desc')
        .limit(limit)
        .offset(offset)
    end
  end
end
