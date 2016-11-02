require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  render_views
  # This should return the minimal set of attributes required to create a valid
  # Car. As you add validations to Car, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    return {
      model: '305',
      brand: 'PEUGEOT',
      registration: 'TR646RT'
    }
  }

  let(:invalid_attributes) {
    return {
      model: '305',
      brand: 'PEUGEOT',
      registration: 'abcdef'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CarsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all cars as @cars", :show_in_doc do
      car = create(:car)
      auth_headers = car.user.create_new_auth_token
      get :index, params: {user_id: car.user.id, format: :json}, headers: auth_headers
      expect(assigns(:cars)).to eq([car])
    end
  end

  describe "GET #show" do
    it "assigns the requested car as @car", :show_in_doc do
      car = create(:car)
      auth_headers = car.user.create_new_auth_token
      get :show, params: {user_id: car.user.id, id: car.to_param, format: :json}, headers: auth_headers
      expect(assigns(:car)).to eq(car)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Car", :show_in_doc do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        expect {
          post :create, params: {user_id: user.id, car: valid_attributes, format: :json}, headers: auth_headers
        }.to change(Car, :count).by(1)
      end

      it "assigns a newly created car as @car" do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        post :create, params: {user_id: user.id, car: valid_attributes, format: :json}, headers: auth_headers
        expect(assigns(:car)).to be_a(Car)
        expect(assigns(:car)).to be_persisted
      end

      it "response status created" do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        post :create, params: {user_id: user.id, car: valid_attributes, format: :json}, headers: auth_headers
        expect(response.status).to eq(201)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved car as @car" do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        post :create, params: {user_id: user.id, car: invalid_attributes, format: :json}, headers: auth_headers
        expect(assigns(:car)).to be_a_new(Car)
      end

      it "response status unprocessable entity", :show_in_doc do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        post :create, params: {user_id: user.id, car: invalid_attributes, format: :json}, headers: auth_headers
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested car" do
        car = create(:car)
        auth_headers = car.user.create_new_auth_token
        put :update, params: {user_id: car.user.id, id: car.to_param, car: new_attributes, format: :json}, headers: auth_headers
        car.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested car as @car" do
        car = create(:car)
        auth_headers = car.user.create_new_auth_token
        put :update, params: {user_id: car.user.id, id: car.to_param, car: valid_attributes, format: :json}, headers: auth_headers
        expect(assigns(:car)).to eq(car)
      end

      it "status ok", :show_in_doc, title: 'success' do
        car = create(:car)
        auth_headers = car.user.create_new_auth_token
        put :update, params: {user_id: car.user.id, id: car.to_param, car: valid_attributes, format: :json}, headers: auth_headers
        expect(response.status).to eq(200)
      end
    end

    context "with invalid params" do
      it "assigns the car as @car" do
        car = create(:car)
        auth_headers = car.user.create_new_auth_token
        put :update, params: {user_id: car.user.id, id: car.to_param, car: invalid_attributes , format: :json}, headers: auth_headers
        expect(assigns(:car)).to eq(car)
      end

      it "response status unprocessable entity", :show_in_doc, title: 'error' do
        car = create(:car)
        auth_headers = car.user.create_new_auth_token
        put :update, params: {user_id: car.user.id, id: car.to_param, car: invalid_attributes, format: :json}, headers: auth_headers
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested car", :show_in_doc do
      car = create(:car)
      auth_headers = car.user.create_new_auth_token
      expect {
        delete :destroy, params: {user_id: car.user.id, id: car.to_param, format: :json}, headers: auth_headers
      }.to change(Car, :count).by(-1)
    end

    it "response status no_content" do
      car = create(:car)
      auth_headers = car.user.create_new_auth_token
      delete :destroy, params: {user_id: car.user.id, id: car.to_param, format: :json}, headers: auth_headers
      expect(response.status).to eq(204)
    end
  end
end
