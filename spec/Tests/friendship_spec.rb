require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Belongs' do
    it { should belong_to(:sent_to) }
    it { should belong_to(:sent_by) }
  end
end
