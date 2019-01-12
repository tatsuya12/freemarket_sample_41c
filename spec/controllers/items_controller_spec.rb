require "rails_helper"

describe ItemsController, type: :controller do
  describe 'GET #show' do
    it "assgins the requested item to @item" do
      user = create(:user)
      brand = create(:brand)
      category = create(:category)
      item = create(:item, buyer_id: user.id, seller_id: user.id, brand_id: brand.id, category_id: category.id)
      delivery = create(:delivery, item_id: item.id)
      get :show, params: { id: item }
      expect(assigns(:item)).to eq item
    end


    it "renders the :show template" do
      user = create(:user)
      brand = create(:brand)
      category = create(:category)
      item = create(:item, buyer_id: user.id, seller_id: user.id, brand_id: brand.id, category_id: category.id )
      delivery = create(:delivery, item_id: item.id)
      get :show, params: { id: item }
      expect(response).to render_template :show
    end
  end
end
