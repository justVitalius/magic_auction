require 'spec_helper'

describe Ability do
  subject(:ability) { Ability.new user }
  let(:user) { nil }

  describe 'admin' do
    let(:user) { create(:admin) }
    it { should be_able_to :manage, :all}
  end

  describe 'user' do
    let(:user) { create(:user) }

    it_behaves_like 'guest'
    it { should be_able_to :create, Bet }
    it { should be_able_to :create, :profile }
  end

  describe 'guest' do
    it_behaves_like 'guest'
    it { should_not be_able_to :create, Bet }
  end

  describe 'dynamic permissions' do
    let(:user) { create(:user) }
    let(:manage_products) { create(:manage_products) }
    let(:manage_categories) { create(:manage_categories) }

    context 'user has no additional permissions' do
      it { should_not be_able_to :manage, Category}
      it { should_not be_able_to :manage, Product}
    end

    context 'user has one permission' do
      before { user.permissions << manage_categories }

      it { should be_able_to :manage, Category}
      it { should_not be_able_to :manage, Product}
    end

    context 'user has several permissions' do
      before do
        user.permissions << manage_categories << manage_products
      end

      it { should be_able_to :manage, Category}
      it { should be_able_to :manage, Product}
    end
  end
end