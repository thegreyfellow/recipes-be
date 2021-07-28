require 'rails_helper'

RSpec.describe IngredientsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/ingredients').to route_to('ingredients#index', format: :json)
    end
  end
end
