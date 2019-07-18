Rails.application.routes.draw do
  resources :products
  post "auth/login" => "authentication#authenticate"
  post "auth/add_attendant" => "user#create" 
end
