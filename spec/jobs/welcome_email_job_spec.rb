# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe WelcomeEmailJob, type: :job do
  include ActiveJob::TestHelper
  let(:user) { create(:user) }
  it 'availability job methods' do
    ActiveJob::Base.queue_adapter = :test
    WelcomeEmailJob.perform(user)
  end
end
