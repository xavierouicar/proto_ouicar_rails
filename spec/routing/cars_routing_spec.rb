require 'rails_helper'

RSpec.describe CarsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/cars').to route_to('cars#index', user_id: '1', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/users/1/cars/1').to route_to('cars#show', user_id: '1', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/users/1/cars').to route_to('cars#create', user_id: '1', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/cars/1').to route_to('cars#update', user_id: '1', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/cars/1').to route_to('cars#update', user_id: '1', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/cars/1').to route_to('cars#destroy', user_id: '1', id: '1', format: :json)
    end
  end
end
