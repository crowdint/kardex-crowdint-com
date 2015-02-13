require 'spec_helper'

describe SyncUsersJob do
  before do
    Sidekiq::Testing.fake!
  end

  it { expect(SyncUsersJob).to be_retryable 3 }
  it { expect(SyncUsersJob).to be_processed_in :users }

  describe '.perform_async' do
    specify{
      expect{ SyncUsersJob.perform_async }.to change(SyncUsersJob.jobs, :size).by(1)
    }
  end

end
