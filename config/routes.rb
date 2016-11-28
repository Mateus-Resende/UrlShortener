Rails.application.routes.draw do
  scope 'api' do
    resources :url_data, except: [:new, :edit]

    get 'total_hits' => 'url_data#get_total_hits'
  end

  get ':id' => 'url_data#redirect_short_url'
end
