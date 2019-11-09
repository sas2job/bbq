require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.create(email: 'userowner@example.org', name: 'John Doe') }
  let(:user_not_owner) { User.create(email: 'someone@example.org', name: 'Someone') }
  let(:event) { user.events.build(title: 'Party') }

  subject { described_class }

  context "when user anonymous" do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end

  context "when user is not owner of event" do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user_not_owner, event) }
    end
  end

  context "when user is owner of event" do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
