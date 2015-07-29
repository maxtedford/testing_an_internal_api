require 'rails_helper'

describe PoptartsController do
  context '#index' do
    it 'returns all the poptarts' do
      Poptart.create(flavor: "strawberry", sprinkles: "red")
      
      get :index, format: :json
      
      expect(response).to have_http_status(:ok)
      poptarts = JSON.parse(response.body)
      expect(poptarts.count).to eq(1)
      poptart = poptarts.first
      expect(poptart['flavor']).to eq('strawberry')
      expect(poptart['sprinkles']).to eq('red')
    end
  end
  
  context '#show' do
    it 'returns the poptart in question' do
      strawberry = Poptart.create(flavor: "strawberry", sprinkles: "red")
      chocolate = Poptart.create(flavor: "chocolate", sprinkles: "brown")
      
      get :show, id: strawberry.id, format: :json
      
      expect(response).to have_http_status(:ok)
      
      poptart_response = JSON.parse(response.body)
      expect(poptart_response['flavor']).to eq('strawberry')
      expect(poptart_response['sprinkles']).to eq('red')
      
      get :show, id: chocolate.id, format: :json

      expect(response).to have_http_status(:ok)
      poptart_response = JSON.parse(response.body)
      expect(poptart_response['flavor']).to eq('chocolate')
      expect(poptart_response['sprinkles']).to eq('brown')
    end
  end
end
