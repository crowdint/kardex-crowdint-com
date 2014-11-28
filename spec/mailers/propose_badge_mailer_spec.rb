require "spec_helper"

describe ProposeBadgeMailer do
  describe '#badge_proposal_notification' do
    let(:propose_badge) { Fabricate.build :propose_badge }
    let(:user) { Fabricate.build :user }
    let(:admin_emails) { ['test@test.com', 'test2@test.com'] }
    let(:email) do
      ProposeBadgeMailer.badge_proposal_notification(
        propose_badge, user, admin_emails
      )
    end

    it { expect(email.from).to eq ['kardex@crowdint.com'] }
    it { expect(email.to).to eq admin_emails }
    it { expect(email.subject).to eq 'Kardex: A new badge was proposed!' }
  end
end
