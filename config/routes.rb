# frozen_string_literal: true

Rails.application.routes.draw do
  resources :properties, only: %i[index show] do
    resources :images, only: [:index] do
      put :update_order, on: :collection
    end
  end
end
