require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    let(:user) {create(:user)} 
    let(:category) {create(:category)}
    let(:brand) {create(:brand)}

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
    it "assgins the requested item to @item" do
      item = create(:item, seller_id: user.id, buyer_id: user.id, category_id: category.id, brand_id: brand.id)
      get :index
      expect(assigns(:items)).to eq([item])
    end
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 4, seller_id: user.id, buyer_id: user.id, category_id: category.id, brand_id: brand.id)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end    
  end
end


