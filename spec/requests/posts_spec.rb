# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /users/index/posts' do
#     before { get '/users/1/posts' }
#     it 'If the response body includes correct placeholder text.' do
#       expect(response.body).to include('Comments:')
#     end
#     it 'If a correct template was rendered.' do
#       expect(response).to render_template('index')
#     end
#     it 'If response status was correct.' do
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe 'GET /users/index/post/id' do
#     before { get '/users/1/posts/1' }
#     it 'If the response body includes correct placeholder text.' do
#       expect(response.body).to include('Comments')
#     end
#     it 'If a correct template was rendered.' do
#       expect(response).to render_template('show')
#     end
#     it 'If response status was correct.' do
#       expect(response).to have_http_status(200)
#     end
#   end
# end
