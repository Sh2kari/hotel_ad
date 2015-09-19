require 'spec_helper'
describe Comment do
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_length_of(:body).is_at_most(140) }
end
