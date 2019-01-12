require "rails_helper"

describe ItemsController, type: :controller do
  describe 'GET #show' do
    it "assgins the requested item to @item" do
      user = create(:user)
      item = create(:item, buyer_id: user.id, seller_id: user.id)
      get :show, params: { id: item }
      expect(assgins(:item)).to eq item
    end


    it "renders the :show template" do
      user = create(:user)
      item = create(:item, buyer_id: user.id, seller_id: user.id)
      get :show, params: { id: item }
      expect(response).to render_template :show
    end
  end
end
