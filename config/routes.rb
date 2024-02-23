Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index, :create, :update, :destroy] do
      collection do
        get 'search'
        get 'approval-queue'
      end

      put 'approval-queue/:id/approve', action: :approve, on: :collection
      put 'approval-queue/:id/reject', action: :reject, on: :collection
    end
  end
end
