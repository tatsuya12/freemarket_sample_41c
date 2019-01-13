require "rails_helper"
describe ItemsController do
  describe 'DELETE #destroy' do
    let!(:user) {create(:user)}
    let!(:brand) {create(:brand)}
    let!(:category) {create(:category)}
    let!(:item) {create(:item, seller_id: user.id, buyer_id: user.id, brand_id: brand.id, category_id: category.id)}
    let!(:image) {create(:image, item_id: item.id)}
    let!(:delivery) {create(:delivery, item_id: item.id)}

    it 'itemを削除すると、itemの持つimageも削除されること' do
      login user
      expect{ item.destroy }.to change{ Image.count }.by(-1)
    end

    it 'itemを削除すると、itemの持つdeliveryも削除されること' do
      login user
      expect{ item.destroy }.to change{ Delivery.count }.by(-1)
    end
  end
end


