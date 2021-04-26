require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Belongs' do
        it { should have_many(:posts) }
        it { should have_many(:comments) }
        it { should have_many(:likes) }
        it { should have_many(:friends) }
        it { should have_many(:friend_sent) }
        it { should have_many(:friend_request) }
        it { should have_many(:pending_requests) }
        it { should have_many(:received_requests) }
    end
end