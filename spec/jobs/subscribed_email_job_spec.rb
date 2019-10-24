# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe SubscribedEmailJob, type: :job do
  include ActiveJob::TestHelper
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  it 'availability job methods' do
    ActiveJob::Base.queue_adapter = :test
    SubscribedEmailJob.perform(user, category)
  end
end
