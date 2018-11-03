RSpec.describe UserMailer, type: :mailer do
  describe 'welcome_email' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Välkommen till Torgny.io')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['torgny@craftacademy.se'])
    end

    it 'renders the body' do
      expect(mail.body).not_to be nil
    end
  end
end
