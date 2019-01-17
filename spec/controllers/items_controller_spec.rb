require "rails_helper"

describe ItemsController, type: :controller do
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

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:brand) { create(:brand) }
    let(:image) { create(:image, item_id: item.id) }
    let(:category) { create(:category) }

    it "saves the new item in tne database" do
      login user
      expect{
        post :create,
             item: attributes_for(:item,
                                   buyer_id: user.id,
                                   seller_id: user.id,
                                    brand_id: brand.id,
                                    category_id: category.id
                                  )
      }.to change(Item, :count).by(1)
    end
  end


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
    let!(:item) {
                 create(
                  :item,
                  seller_id: user.id,
                  brand_id: brand.id,
                  category_id: category.id
                )
               }
    let(:updated_attributes) do
      {
        name: "アイテム編集",
        price: "300",
        status: "ステータス２",
        size: "L",
        condition: "中古",
        introduction: "アイテム説明文編集",
        shipping_charge: "送料編集",
        origin_region: "東京都編集",
        shipping_method: "速達編集",
        shipping_days: "編集で発送"
      }
    end

    it 'saves updated item' do
      login user
      expect do
        patch :update, params: { id: item.id, item: updated_attributes }, session: {}
        end.to change(Item, :count).by(0)
      end

    it "change item's attribute" do
      login user
      patch :update, params: { id: item.id, item: updated_attributes }, session: {}
      item.reload
      expect(item.name).to eq("アイテム編集")
      expect(item.price).to eq(300)
      expect(item.status).to eq("ステータス２")
      expect(item.size).to eq("L")
      expect(item.condition).to eq("中古")
      expect(item.introduction).to eq("アイテム説明文編集")
      expect(item.shipping_charge).to eq("送料編集")
      expect(item.origin_region).to eq("東京都編集")
      expect(item.shipping_method).to eq("速達編集")
      expect(item.shipping_days).to eq("編集で発送")
    end
  end
end


