Rails.application.routes.draw do
  # get 'medicines_inventories/index'
  # get 'medicines_inventories/create'
  # get 'medicines_inventories/show'
  # get 'medicines_inventories/update'
  # get 'medicines_inventories/destroy'
  # get 'appointments/index'
  # get 'appointments/create'
  # get 'appointments/show'
  # get 'appointments/update'
  # get 'appointments/destroy'
  # get 'patients/index'
  # get 'patients/create'
  # get 'patients/show'
  # get 'patients/update'
  # get 'patients/destroy'
  # get 'doctors/index'
  # get 'doctors/create'
  # get 'doctors/show'
  # get 'doctors/update'
  # get 'doctors/destroy'
  resources :appointments do
    member do
      get 'appointment_completed', to: 'appointments#appointment_completion'
    end
  end
  resources :doctors do
    member do
      get 'patients_by_a_doctor', to: 'doctors#patients_by_doctor'
    end
  end
  resources :patients do
    member do
      get 'doctors_by_a_patient', to: 'patients#doctors_by_patient'
      get 'medicines_of_a_patient', to: 'patients#medicine_inventories_by_patient'
      get 'patient_medicines_by_a_doctor', to: 'patients#patient_medicines_by_doctor'
    end
  end
  resources :medicines_inventories do
    member do
      get 'patients_of_a_medicine', to: 'medicines_inventories#patients_by_medicine_inventory'
    end
  end
  resources :patient_medicines
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
