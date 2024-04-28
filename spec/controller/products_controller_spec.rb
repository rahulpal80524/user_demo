require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new product' do
        expect {
          post :create, params: { product: attributes_for(:product) }
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post :create, params: { product: attributes_for(:product) }
        expect(response).to redirect_to(Product.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new product' do
        expect {
          post :create, params: { product: attributes_for(:product, name: nil) }
        }.to_not change(Product, :count)
      end

      it 'returns a success response (i.e., to display the "new" template)' do
        post :create, params: { product: attributes_for(:product, name: nil) }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'New Name' } }

      it 'updates the requested product' do
        patch :update, params: { id: product.to_param, product: new_attributes }
        product.reload
        expect(product.name).to eq('New Name')
      end

      it 'redirects to the product' do
        patch :update, params: { id: product.to_param, product: new_attributes }
        expect(response).to redirect_to(product)
      end
    end

    context 'with invalid parameters' do
      it 'returns a success response (i.e., to display the "edit" template)' do
        patch :update, params: { id: product.to_param, product: attributes_for(:product, name: nil) }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product' do
      product = create(:product)
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products list' do
      delete :destroy, params: { id: product.to_param }
      expect(response).to redirect_to(products_url)
    end
  end
end
