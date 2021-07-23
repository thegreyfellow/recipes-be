# frozen_string_literal: true

class RecipesController < ApplicationController
  # GET /recipes
  def index
    limit = params[:per_page].to_i
    page = params[:page].to_i
    offset = [page.to_i - 1, 0].max * limit

    people_quantity = params[:quantity]
    difficulty = params[:difficulty]
    ingredients = params[:ingredients] || []

    query = Recipe.joins(:ingredients)
    query = query.where(people_quantity: people_quantity) if people_quantity.present?
    query = query.where(difficulty: difficulty) if difficulty.present?

    @ingredients_with_percetage_signs = ingredients.map { |val| "%#{val}%" }
    query = if ingredients.empty?
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

    @recipes = query
    @pagination = {
      items: limit,
      next: (page >= 1 ? page : 1) + 1
    }
  end
end
