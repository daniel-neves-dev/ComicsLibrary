require 'rails_helper'

RSpec.describe "Comics", type: :request do
  it 'return all comics' do
    get '/api/comics'
    expect(response).to have_http_status(:success)
  end
end
