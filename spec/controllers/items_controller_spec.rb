require "rails_helper"

describe ItemsController, type: :controller do
  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:brand) { create(:brand) }
    let(:category) { create(:category) }
    let(:item) {
                 create(
                  :item,
                  buyer_id: user.id,
                  seller_id: user.id,
                  brand_id: brand.id,
                  category_id: category.id
                )
               }
    let(:delivery) { create(:delivery, item_id: item.id) }
    before do
      get :show, params: { id: item }
    end

    it "assigns the requested item to @item" do
      expect(assigns(:item)).to eq item
    end


    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }
    let(:brand) { create(:brand) }
    let(:category) { create(:category) }
    let(:item) {
                 create(
                  :item,
                  buyer_id: user.id,
                  seller_id: user.id,
                  brand_id: brand.id,
                  category_id: category.id
                )
               }
    let(:delivery) { create(:delivery, item_id: item.id) }

    before do
      get :edit, params: { id: item }
    end

    it "assigns the requested item to @item" do
      expect(assigns(:item)).to eq item
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:brand) { create(:brand) }
    let(:category) { create(:category) }
    let(:item) {
                 create(
                  :item,
                  buyer_id: user.id,
                  seller_id: user.id,
                  brand_id: brand.id,
                  category_id: category.id
                )
               }
    let(:delivery) { create(:delivery, item_id: item.id) }

    it 'saves updated item' do
      login user
      item = create(:item, buyer_id: user.id, seller_id: user.id, brand_id: brand.id, category_id: category.id )
      expect do
        patch :update, params: { id: item, name: "アイテム編集", price: "300", status: "ステータス２", size: "L", condition: "中古", introduction: "アイテム説明文編集" }
        end.to change(Item, :count).by(0)
      end

    it "change item's attribute" do
      login user
      patch :update, params: { id: item, name: "アイテム編集", price: "300", status: "ステータス２", size: "L", condition: "中古", introduction: "アイテム説明文編集" }
      item.reload
      expect(item.name).to eq("アイテム編集")
      expect(item.price).to eq(300)
      expect(item.status).to eq("ステータス２")
      expect(item.size).to eq("L")
      expect(item.condition).to eq("中古")
      expect(item.introduction).to eq("アイテム説明文編集")
    end
  end
end
