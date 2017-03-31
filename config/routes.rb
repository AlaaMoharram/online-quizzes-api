Rails.application.routes.draw do
  resources :quizzes do
    resources :mcq_questions do
    	resources :mcq_choices
    end
    resources :short_answer_questions
    resources :mcq_checkboxes do
    	resources :mcq_checkbox_choices
    end
  end
end
