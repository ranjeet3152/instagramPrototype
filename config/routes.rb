Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:user_id', to: 'home#load_user'
  get '/images/:image_id', to: 'home#load_image'
  get '/image/fetch_all_images'
end
