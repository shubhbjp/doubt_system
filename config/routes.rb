Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "login#index"
  match "/login/save", to: "login#save_login", via: [:post]
  
  match "questions", to: "questions#index", via: [:get, :post]
  match "questions/view", to: "questions#view", via: [:get, :post]
  match "/questions/ask-doubt", to: "questions#save_doubt", via: [:post]
  match "/questions/solve-doubt", to: "questions#solve_doubt", via: [:get]
  match "/questions/solve-doubt/:id", to: "questions#solve_specific_question", via: [:get]
  match "/answer/save", to: "questions#save_answers", via: [:post]
  
  match "/comment/save", to: "comments#save_comment", via: [:post]

end
