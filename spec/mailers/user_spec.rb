require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'welcome_email' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to My gallery Site')
    end

    it 'renders the send meiit to' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the send meiit from' do
      expect(mail.from).to eq([ENV['MAILER_EMAIL']])
    end
  end

  describe 'subscribed_email' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:mail) { UserMailer.subscribed_email(user, category) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Succesfull subscribed')
    end

    it 'renders the send meiit to' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the send meiit from' do
      expect(mail.from).to eq([ENV['MAILER_EMAIL']])
    end
  end

  describe 'new_image_in_subscribes_email' do
    let(:category) { create(:category) }
    let(:mail) { UserMailer.new_image_in_subscribes_email(category) }

    it 'renders the headers' do
      create(:subscriber, category_id: category.id)
      create(:subscriber, category_id: category.id)
      create(:subscriber, category_id: category.id)
      expect(mail.subject).to eq('New image in subscribed category')
    end

    it 'no such mail if no subscribers' do
      expect(mail.subject).to eq(nil)
    end

    it 'renders the send meiit to' do
      user = create(:subscriber, category_id: category.id)
      expect(mail.to).to eq([user.user.email])
    end

    it 'renders the send meiit from' do
      create(:subscriber, category_id: category.id)
      expect(mail.from).to eq([ENV['MAILER_EMAIL']])
    end

    it 'no sender if no subscribers' do
      expect(mail.from).to eq(nil)
    end
  end
end
