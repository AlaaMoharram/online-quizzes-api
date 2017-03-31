require 'rails_helper'

RSpec.describe 'McqCheckboxes API' do

  # Initialize the test data
  let!(:quiz) { create(:quiz) }
  let!(:mcq_checkboxes) { create_list(:mcq_checkbox, 20, quiz_id: quiz.id) }
  let(:quiz_id) { quiz.id }
  let(:id) { mcq_checkboxes.first.id }

  # Test suite for GET /quizzes/:quiz_id/mcq_checkboxes
  describe 'GET /quizzes/:quiz_id/mcq_checkboxes' do
    before { get "/quizzes/#{quiz_id}/mcq_checkboxes" }

    context 'when quiz exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all quiz mcq_checkboxes' do
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

  # Test suite for GET /quizzes/:quiz_id/mcq_checkboxes/:id
  describe 'GET /quizzes/:quiz_id/mcq_checkboxes/:id' do
    before { get "/quizzes/#{quiz_id}/mcq_checkboxes/#{id}" }

    context 'when quiz mcq_checkbox exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the mcq_checkbox' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when quiz mcq_checkbox does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find McqCheckbox/)
      end
    end
  end

  # Test suite for POST /quizzes/:quiz_id/mcq_checkboxes
  describe 'POST /quizzes/:quiz_id/mcq_checkboxes' do
    let(:valid_attributes) { { text: 'Visit Narnia'} }

    context 'when request attributes are valid' do
      before { post "/quizzes/#{quiz_id}/mcq_checkboxes", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/quizzes/#{quiz_id}/mcq_checkboxes", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Text can't be blank/)
      end
    end
  end

  # Test suite for PUT /quizzes/:quiz_id/mcq_checkboxes/:id
  describe 'PUT /quizzes/:quiz_id/mcq_checkboxes/:id' do
    let(:valid_attributes) { { text: 'Mozart' } }

    before { put "/quizzes/#{quiz_id}/mcq_checkboxes/#{id}", params: valid_attributes }

    context 'when mcq_checkbox exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the mcq_checkbox' do
        updated_question = McqCheckbox.find(id)
        expect(updated_question.text).to match(/Mozart/)
      end
    end

    context 'when the mcq_checkbox does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find McqCheckbox/)
      end
    end
  end

  # Test suite for DELETE /quizzes/:quiz_id/mcq_checkboxes/:id
  describe 'DELETE /quizzes/:quiz_id/mcq_checkboxes/:id' do
    before { delete "/quizzes/#{quiz_id}/mcq_checkboxes/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end