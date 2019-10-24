# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

RSpec.describe NewImageSubscribedEmailJob, type: :job do
  include ActiveJob::TestHelper
  let(:category) { create(:category) }
  it 'availability job methods' do
    ActiveJob::Base.queue_adapter = :test
    NewImageSubscribedEmailJob.perform(category)
  end
end
