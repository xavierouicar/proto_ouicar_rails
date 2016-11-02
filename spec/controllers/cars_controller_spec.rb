require 'rails_helper'

RSpec.describe CarsController, type: :controller do
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
      get :index, user_id: car.user.id, format: :json
      expect(assigns(:cars)).to eq([car])
    end
  end

  describe "GET #show" do
    it "assigns the requested car as @car", :show_in_doc do
      car = create(:car)
      get :show, user_id: car.user.id, id: car.to_param, format: :json
      expect(assigns(:car)).to eq(car)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Car", :show_in_doc do
        user = create(:user)
        expect {
          post :create, user_id: user.id, car: valid_attributes, format: :json
        }.to change(Car, :count).by(1)
      end

      it "assigns a newly created car as @car" do
        user = create(:user)
        post :create, user_id: user.id, car: valid_attributes, format: :json
        expect(assigns(:car)).to be_a(Car)
        expect(assigns(:car)).to be_persisted
      end

      it "response status created" do
        user = create(:user)
        post :create, user_id: user.id, car: valid_attributes, format: :json
        expect(response.status).to eq(201)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved car as @car" do
        user = create(:user)
        post :create, user_id: user.id, car: invalid_attributes, format: :json
        expect(assigns(:car)).to be_a_new(Car)
      end

      it "response status unprocessable entity", :show_in_doc do
        user = create(:user)
        post :create, user_id: user.id, car: invalid_attributes, format: :json
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested car", :show_in_doc do
        car = create(:car)
        put :update, user_id: car.user.id, id: car.to_param, car: new_attributes, format: :json
        car.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested car as @car" do
        car = create(:car)
        put :update, user_id: car.user.id, id: car.to_param, car: valid_attributes, format: :json
        expect(assigns(:car)).to eq(car)
      end

      it "status ok" do
        car = create(:car)
        put :update, user_id: car.user.id, id: car.to_param, car: valid_attributes, format: :json
        expect(response.status).to eq(200)
      end
    end

    context "with invalid params" do
      it "assigns the car as @car" do
        car = create(:car)
        put :update, user_id: car.user.id, id: car.to_param, car: invalid_attributes , format: :json
        expect(assigns(:car)).to eq(car)
      end

      it "response status unprocessable entity", :show_in_doc do
        car = create(:car)
        put :update, user_id: car.user.id, id: car.to_param, car: invalid_attributes, format: :json
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested car", :show_in_doc do
      car = create(:car)
      expect {
        delete :destroy, user_id: car.user.id, id: car.to_param, format: :json
      }.to change(Car, :count).by(-1)
    end

    it "response status no_content" do
      car = create(:car)
      delete :destroy, user_id: car.user.id, id: car.to_param, format: :json
      expect(response.status).to eq(204)
    end
  end
end
