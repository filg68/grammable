require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "gram#show action" do
    it "should successfully show the page if the gram is found" do
      gram = FactoryBot.create(:gram)
      get :show, params: {id: gram.id}
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 eror if the gram is not found" do
      get :show, params: { id: 'TACOCAT'}
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "grams#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "grams#new action" do
    it "should successfully show the new gram form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "grams@create action" do
    it "should successfully create a gram in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: {gram: {message: 'Hello!'}}
      expect(response).to redirect_to root_path

      gram = Gram.last
      expect(gram.message).to eq("Hello!")
      expect(gram.user).to eq(user)

    end
   
    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      gram_count = Gram.count
      post :create, params: { gram: { message: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Gram.count).to eq gram_count
    end
  end



end
