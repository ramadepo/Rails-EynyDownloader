Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  
  resource :eyny_downloader, :only=>[:show], to: "eyny_downloader#index" do
    post :download, to: "eyny_downloader#download"
  end
  

end
