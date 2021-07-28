require 'rails_helper'

RSpec.describe RecipesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/recipes').to route_to('recipes#index', format: :json)
    end
  end
end
