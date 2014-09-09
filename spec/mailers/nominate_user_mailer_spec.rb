require "spec_helper"

describe NominateUserMailer do
  describe '#nominate_user_notification' do
    let(:user) { Fabricate.build :user }
    let(:nominee_user) { Fabricate.build :nominee_user }
    let(:admin_emails) { ['test@example.com', 'text2@example.com'] }
    let(:email) do
      NominateUserMailer.nominate_user_notification(
        nominee_user, user, admin_emails
      )
    end

    it { expect(email.from).to eq [user.email] }
    it { expect(email.to).to eq admin_emails }
    it { expect(email.subject).to eq 'Kardex: A user was nominated!' }
  end
end
