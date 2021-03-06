require 'rails_helper'

describe 'GET /columns', :type => :request do
  let!(:columns) { create(:column) }

  before { get '/columns' }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all columns' do
    body = JSON.parse(response.body)

    expect(body.count).to eq(1)
    expect(body[0]['correspondences']).to eq([])
  end
end

describe 'GET /columns/:id', :type => :request do
  let!(:column) { create(:column) }

  before { get "/columns/#{column.query_param}" }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns one column' do
    body = JSON.parse(response.body)
    expect(body.count).to eq(2)
    expect(body['correspondences']).to eq([])
  end
end
