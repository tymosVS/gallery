# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeEmailJob, type: :job do
  include ActiveJob::TestHelper
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { create(:user) }
  it 'availability job methods' do
    ActiveJob::Base.queue_adapter = :test
    WelcomeEmailJob.perform(user)
  end
end
