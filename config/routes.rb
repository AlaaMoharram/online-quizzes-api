Rails.application.routes.draw do
  resources :quizzes do
    resources :mcq_questions do
    	resources :mcq_choices
    end
  end
end
