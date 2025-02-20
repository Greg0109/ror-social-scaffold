require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Belongs' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
