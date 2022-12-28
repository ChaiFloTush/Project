require 'rails_helper'

RSpec.describe "Articles", type: :system do
  describe 'GET /' do
    before { get root_path } 
  
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  
    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
end
