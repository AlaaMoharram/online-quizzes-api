require 'rails_helper'

RSpec.describe 'Quizzes API', type: :request do

	# initialize test data 
  	let!(:quizzes) { create_list(:quiz, 10) }
  	let(:quiz_id) { quizzes.first.id }

  	# Test suite for GET /quizzes
  	describe 'GET /quizzes' do
  		# make HTTP get request before each example
  		before { get '/quizzes' }

  		it 'returns quizzes' do
  			expect(json).not_to be_empty
  			expect(json.size).to eq(10)
  		end

  		it 'returns status code 200' do
  			expect(response).to have_http_status(200)
  		end
  	end

  	# Test suite for GET /quizzes/:id
  	describe 'GET /quizzes/:id' do
  		before { get "/quizzes/#{quiz_id}" }

  		context 'when the record exists' do
  			it 'returns the quiz' do
        		expect(json).not_to be_empty
        		expect(json['id']).to eq(quiz_id)
        	end

        	it 'returns status code 200' do
        		expect(response).to have_http_status(200)
        	end
        end

        context 'when the record does not exist' do
        	let(:quiz_id) { 100 }
        	it 'returns status code 404' do
        		expect(response).to have_http_status(404)
        	end
        	it 'returns a not found message' do
        		expect(response.body).to match(/Couldn't find Quiz/)
        	end
        end
    end

    # Test suite for POST /quizzes
    describe 'POST /quizzes' do
	    let(:valid_attributes) { { title: 'Learn Elm'} }

	    context 'when the request is valid' do
	    	before { post '/quizzes', params: valid_attributes }
	    	it 'creates a quiz' do
	    		expect(json['title']).to eq('Learn Elm')
	    	end
	    	it 'returns status code 201' do
	    		expect(response).to have_http_status(201)
	      	end
	    end

	    context 'when the request is invalid' do
	    	before { post '/quizzes', params: {} }
	    	it 'returns status code 422' do
	    		expect(response).to have_http_status(422)
	    	end
	    	it 'returns a validation failure message' do
	    		expect(response.body).to match(/Validation failed: Title can't be blank/)
	    	end
	    end

	end

	# Test suite for PUT /quizzes/:id
	describe 'PUT /quizzes/:id' do
		let(:valid_attributes) { { title: 'Quiz 1' } }

		context 'when the record exists' do
			before { put "/quizzes/#{quiz_id}", params: valid_attributes }
			it 'updates the record' do
				expect(response.body).to be_empty
			end
			it 'returns status code 204' do
				expect(response).to have_http_status(204)
			end
		end
	end

	# Test suite for DELETE /quizzes/:id
	describe 'DELETE /quizzes/:id' do
		before { delete "/quizzes/#{quiz_id}" }
		it 'returns status code 204' do
			expect(response).to have_http_status(204)
		end
	end

end























