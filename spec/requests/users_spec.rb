# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET /index' do
#     before { get '/users' }
#     it 'If the response body includes correct placeholder text.' do
#       expect(response.body).to include('Number of Posts:')
#     end
#     it 'If a correct template was rendered.' do
#       expect(response).to render_template('index')
#     end
#     it 'If response status was correct.' do
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe 'GET /index/id' do
#     before { get '/users/1' }
#     it 'If the response body includes correct placeholder text.' do
#       expect(response.body).to include('Bio')
#     end
#     it 'If a correct template was rendered.' do
#       expect(response).to render_template('show')
#     end
#     it 'If response status was correct.' do
#       expect(response).to have_http_status(200)
#     end
#   end
# end
