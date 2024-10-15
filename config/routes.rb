# frozen_string_literal: true

Rails.application.routes.draw do
  resources :properties, only: %i[index show] do
    resources :images, only: [:index] do
      collection do
        patch 'reorder'
      end
    end
  end
end
