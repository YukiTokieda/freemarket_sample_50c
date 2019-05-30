require 'rails_helper'

describe ProductsController do
  describe 'GET #edit' do
    let(:categories) { create(:categories) }
    before { get :edit, params: { parent_id: 0 } }
    let(:category) {Category.where(parent_id: 0)}
    it "正しくeditできる" do
      expect(categories.present?).to eq(true)
      expect(response.status).to eq 200
    end
  end
end
