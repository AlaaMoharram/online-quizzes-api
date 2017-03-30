require 'rails_helper'

RSpec.describe 'McqChoices API' do

	# Initialize the test data
  	let!(:quiz) { create(:quiz) }
  	let!(:mcq_question) { create(:mcq_question, quiz_id: quiz.id) }
  	let!(:mcq_choices) { create_list(:mcq_choice, 20, mcq_question_id: mcq_question.id) }
  	let(:quiz_id) { quiz.id }
  	let(:mcq_question_id) { mcq_question.id }
  	let(:id) { mcq_choices.first.id }

  	# Test suite for GET /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices
  	describe 'GET /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices' do
    	before { get "/quizzes/#{quiz_id}/mcq_questions/#{mcq_question_id}/mcq_choices" }

    	context 'when quiz exists' do
    		context 'when mcq question exists' do
    			it 'returns status code 200' do
        			expect(response).to have_http_status(200)
      			end

      			it 'returns all question mcq_choices' do
        			expect(json.size).to eq(20)
      			end
    		end

    		context 'when mcq question does not exist' do
    			let(:mcq_question_id) { 0 }
    			it 'returns status code 404' do 
    				expect(response).to have_http_status(404)
    			end

    			it 'returns a not found message' do
    				expect(response.body).to match(/Couldn't find McqQuestion/)
    			end
    		end
    	end

    	context 'when quiz does not exist' do
      		let(:quiz_id) { 0 }

      		it 'returns status code 404' do
        		expect(response).to have_http_status(404)
      		end

      		it 'returns a not found message' do
        		expect(response.body).to match(/Couldn't find Quiz/)
      		end
    	end
  	end

  	# Test suite for GET /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id
  	describe 'GET /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id' do
    	before { get "/quizzes/#{quiz_id}/mcq_questions/#{mcq_question_id}/mcq_choices/#{id}" }

    	context 'when mcq_question mcq_choice exists' do
    		it 'returns status code 200' do
        		expect(response).to have_http_status(200)
      		end

      		it 'returns the mcq_choice' do
        		expect(json['id']).to eq(id)
      		end
    	end

    	context 'when mcq_question mcq_choice does not exist' do
      		let(:id) { 0 }

      		it 'returns status code 404' do
        		expect(response).to have_http_status(404)
      		end

      		it 'returns a not found message' do
        		expect(response.body).to match(/Couldn't find McqChoice/)
      		end
    	end
    end

    # Test suite for POST /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices
  	describe 'POST /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices' do
    	let(:valid_attributes) { { text: 'Visit Narnia'} }

    	context 'when request attributes are valid' do
      		before { post "/quizzes/#{quiz_id}/mcq_questions/#{mcq_question_id}/mcq_choices", params: valid_attributes }

      		it 'returns status code 201' do
        		expect(response).to have_http_status(201)
      		end
    	end

    	context 'when an invalid request' do
      		before { post "/quizzes/#{quiz_id}/mcq_questions/#{mcq_question_id}/mcq_choices", params: {} }

      		it 'returns status code 422' do
        		expect(response).to have_http_status(422)
      		end

      		it 'returns a failure message' do
        		expect(response.body).to match(/Validation failed: Text can't be blank/)
      		end
    	end
  	end

  	# Test suite for PUT /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id
  	describe 'PUT /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id' do
    	let(:valid_attributes) { { text: 'Mozart' } }

    	before { put "/quizzes/#{quiz_id}/mcq_questions/#{mcq_question_id}/mcq_choices/#{id}", params: valid_attributes }

    	context 'when mcq_choice exists' do
      		it 'returns status code 204' do
        		expect(response).to have_http_status(204)
      		end

      		it 'updates the mcq_choice' do
        		updated_choice = McqChoice.find(id)
        		expect(updated_choice.text).to match(/Mozart/)
      		end
    	end

    	context 'when the mcq_choice does not exist' do
      		let(:id) { 0 }

      		it 'returns status code 404' do
        		expect(response).to have_http_status(404)
      		end

      		it 'returns a not found message' do
        		expect(response.body).to match(/Couldn't find McqChoice/)
      		end
    	end
  	end

  	# Test suite for DELETE /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id
  	describe 'DELETE /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id' do
    	before { delete "/quizzes/#{quiz_id}/mcq_questions/#{mcq_question_id}/mcq_choices/#{id}" }

    	it 'returns status code 204' do
      		expect(response).to have_http_status(204)
    	end
  	end

end
