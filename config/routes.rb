Rails.application.routes.draw do

  root 'robots#index'

  get '/run', to: 'robots#run', as: :send_requests

end
