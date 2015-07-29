require 'rails_helper'

describe PoptartsController do
  context '#index' do
    it 'returns all the poptarts' do
      Poptart.create(flavor: "strawberry", sprinkles: "red")
      
      get :index, format: :json
      
      expect(response).to have_http_status(:ok)
      expect(response.body.count).to eq(1)
    end
  end
end
