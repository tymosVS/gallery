# frozen_string_literal: true

require 'rails_helper'

describe Subscriber, type: :feature do

  context 'subscribes' do
    let(:user) { create(:user) }

    scenario 'availability subscribe for loggined users' do
      create(:category)
      sign_in user
      visit categories_path
      expect(page).to have_selector('.subscribe')
    end

    scenario 'not availability subscribe for loggouted users' do
      create(:category)
      visit categories_path
      expect(page).to_not have_selector('.subscribe')
    end
  end
end
