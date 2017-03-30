require 'rails_helper'

RSpec.describe 'McqQuestions API' do

  # Initialize the test data
  let!(:quiz) { create(:quiz) }
  let!(:mcq_questions) { create_list(:mcq_question, 20, quiz_id: quiz.id) }
  let(:quiz_id) { quiz.id }
  let(:id) { mcq_questions.first.id }

  # Test suite for GET /quizzes/:quiz_id/mcq_questions
  describe 'GET /quizzes/:quiz_id/mcq_questions' do
    before { get "/quizzes/#{quiz_id}/mcq_questions" }

    context 'when quiz exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all quiz mcq_questions' do
        expect(json.size).to eq(20)
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

  # Test suite for GET /quizzes/:quiz_id/mcq_questions/:id
  describe 'GET /quizzes/:quiz_id/mcq_questions/:id' do
    before { get "/quizzes/#{quiz_id}/mcq_questions/#{id}" }

    context 'when quiz mcq question exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the mcq_question' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when quiz mcq_question does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find McqQuestion/)
      end
    end
  end

  # Test suite for POST /quizzes/:quiz_id/mcq_questions
  describe 'POST /quizzes/:quiz_id/mcq_questions' do
    let(:valid_attributes) { { text: 'Visit Narnia'} }

    context 'when request attributes are valid' do
      before { post "/quizzes/#{quiz_id}/mcq_questions", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/quizzes/#{quiz_id}/mcq_questions", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Text can't be blank/)
      end
    end
  end

  # Test suite for PUT /quizzes/:quiz_id/mcq_questions/:id
  describe 'PUT /quizzes/:quiz_id/mcq_questions/:id' do
    let(:valid_attributes) { { text: 'Mozart' } }

    before { put "/quizzes/#{quiz_id}/mcq_questions/#{id}", params: valid_attributes }

    context 'when mcq_question exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the mcq_question' do
        updated_question = McqQuestion.find(id)
        expect(updated_question.text).to match(/Mozart/)
      end
    end

    context 'when the mcq_question does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find McqQuestion/)
      end
    end
  end

  # Test suite for DELETE /quizzes/:quiz_id/mcq_questions/:id
  describe 'DELETE /quizzes/:quiz_id/mcq_questions/:id' do
    before { delete "/quizzes/#{quiz_id}/mcq_questions/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end