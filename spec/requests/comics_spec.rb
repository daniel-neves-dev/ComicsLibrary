require 'rails_helper'

RSpec.describe "Comics", type: :request do
  let(:comic) {Comic.create(title: "The Batman",author: author.id, synopsis: "The first year of the dark night in Gotham City")}
  let(:author) { Author.create(first_name: "Frank", last_name: "Miller", age: 66) }

  let(:valid_attributes) do
    { title: "The Batman", author_id: author.id, synopsis: "The first year of the dark night in Gotham City" }
  end


  context 'GET/comics' do
    it 'return all comics' do
      Comic.create valid_attributes
      get '/api/comics'
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST/comics' do
    it 'crete a new comic' do
      expect{
        post '/api/comics', params: {comic: valid_attributes, author:{first_name: "Frank", last_name: "Miller", age: 66}}
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
