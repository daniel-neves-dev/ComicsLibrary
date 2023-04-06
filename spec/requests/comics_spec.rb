require 'rails_helper'

RSpec.describe "Comics", type: :request do
  let(:title) {"Conan the Barbarian"}
  let(:author) {"Mcmillan"}

  let(:valid_attributes) do
    { title: title, author: author }
  end


  context 'GET/comics' do
    it 'return all comics' do
      Comic.create! valid_attributes
      get '/api/comics'
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST/comics' do
    it 'crete a new comic' do
      expect{
        post '/api/comics', params: {comic: valid_attributes}
      }.to change {Comic.count}.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  context 'DELETE/comics' do
    it 'delete a comic' do
      comic = Comic.create! valid_attributes
      delete "/api/comics/#{comic.id}"
      expect(response).to have_http_status(:no_content)
    end

  end
end
