require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "正しいビューに変遷する" do
      get :index
      expect(response).to render_template :index
    end

    it "@itemが期待される値を持つ" do
      item = create(:item, seller_id: user.id, buyer_id: user.id, category_id: category.id, brand_id: brand.id)
      user = create(:user)
      brand = create(:brand)
      category = create(:category)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end    
  end
end