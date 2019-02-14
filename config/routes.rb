Rails.application.routes.draw do
  resources :videos
  resources :photos
  devise_for :users
  resources :signups
  resources :buskings
  resources :performances
  resources :tips
  resources :posts
  resources :tests
  
  resources :comments, only: [:create, :destroy]
  
  # my page
  get '/my_page', to: 'main#mypage', as: 'my_page'

  root 'main#index'
  get 'users/sign_in'
  get'/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destory'
  
  # 홈화면
  get 'main/index'
  get 'mail/main'
  
  # mail
  get 'mail/index'
  post '/mail/write' => 'mail#write'
  
  # line up
  resources :performances, except: [:show] do
     post "/performance_like", to: "performance_likes#performance_like_toggle"
  end
  post '/:x_id/comment_per_create' => 'performances#comment_create'
  get '/:x_id/comment_per_destroy/:c_id' => 'performances#comment_destroy'
  
  
  get '/performances/performance_like/:performance_id' => 'performances#performance_like'

  
  # community
  resources :posts, except: [:show] do
     post "/like", to: "likes#like_toggle"
  end
  post '/:x_id/comment_create' => 'posts#comment_create'
  get '/:x_id/comment_destroy/:c_id' => 'posts#comment_destroy'
  
  get '/posts/like/:post_id' => 'posts#like'
 
  
  
  post 'performances/result'      => 'performances#result'   # 검색 결과 페이지
  get 'performances/result2/:keyword' => 'performances#result2' #다음카카오 API 결과 페이지
  
  
  post 'tips/result'      => 'tips#result'   # 검색 결과 페이지
  get 'tips/result2/:keyword' => 'tips#result2' #다음카카오 API 결과 페이지
  
  post 'buskings/result'      => 'buskings#result'   # 검색 결과 페이지
  get 'buskings/result2/:keyword' => 'buskings#result2' #다음카카오 API 결과 페이지
  
  post 'posts/result'      => 'posts#result'   # 검색 결과 페이지
  get 'posts/result2/:keyword' => 'posts#result2' #다음카카오 API 결과 페이지
  
  # 날짜로 공연 찾기
  get '/main/search'
  
  # tip
  post '/:x_id/comment_tip_create' => 'tips#comment_create'
  get '/:x_id/comment_tip_destroy/:c_id' => 'tips#comment_destroy'
  
  # busking
  post '/:x_id/comment_busking_create' => 'buskings#comment_create'
  get '/:x_id/comment_busking_destroy/:c_id' => 'buskings#comment_destroy'
  
  # like
  post '/post/:post_id/like_per'      => 'likes#like_per_toggle', as: 'like_per'
  post '/post/:post_id/like'          => 'likes#like_toggle', as: 'like_post'
  post '/post/:post_id/like_tip'      => 'likes#like_tip_toggle', as: 'like_tip'
  post '/post/:post_id/like_busking'  => 'likes#like_busking_toggle', as: 'like_busking'
  post '/post/:post_id/like_photo'    => 'likes#like_photo_toggle', as: 'like_photo'
  post '/post/:post_id/like_video'    => 'likes#like_video_toggle', as: 'like_video'
  
  resources :performances, except: [:show] do
     post "/like", to: "likes#like_toggle"
     end
  
   # video
  post '/:x_id/comment_video_create' => 'videos#comment_create'
  get '/:x_id/comment_video_destroy/:c_id' => 'videos#comment_destroy'
   
   # photo
  post '/:x_id/comment_photo_create' => 'photos#comment_create'
  get '/:x_id/comment_photo_destroy/:c_id' => 'photos#comment_destroy'
  
  # 댓글 수정, 삭제
  get '/:x_id/comment_per_edit/:c_id' => 'performances#comment_per_edit', as: 'comment_per_edit'
  post '/:x_id/comment_per_update/:c_id' => 'performances#comment_per_update', as: 'comment_per_update'
  
  get '/:x_id/comment_comu_edit/:c_id' => 'posts#comment_comu_edit', as: 'comment_comu_edit'
  post '/:x_id/comment_comu_update/:c_id' => 'posts#comment_comu_update', as: 'comment_comu_update'
  
  get '/:x_id/comment_tip_edit/:c_id' => 'tips#comment_tip_edit', as: 'comment_tip_edit'
  post '/:x_id/comment_tip_update/:c_id' => 'tips#comment_tip_update', as: 'comment_tip_update'
  
  get '/:x_id/comment_busking_edit/:c_id' => 'buskings#comment_busking_edit', as: 'comment_busking_edit'
  post '/:x_id/comment_busking_update/:c_id' => 'buskings#comment_busking_update', as: 'comment_busking_update'
  
  get '/:x_id/comment_photo_edit/:c_id' => 'photos#comment_photo_edit', as: 'comment_photo_edit'
  post '/:x_id/comment_photo_update/:c_id' => 'photos#comment_photo_update', as: 'comment_photo_update'
  
  get '/:x_id/comment_video_edit/:c_id' => 'videos#comment_video_edit', as: 'comment_video_edit'
  post '/:x_id/comment_video_update/:c_id' => 'videos#comment_video_update', as: 'comment_video_update'
  
  #ed upon order of creation: first created -> highest priority.
  # See how all your ro
  
  
  # The priority is basutes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
