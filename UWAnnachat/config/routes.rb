UWAnnachat::Application.routes.draw do
  resources :chatrooms
  resources :messages
  resources :chat
  resources :users
end
