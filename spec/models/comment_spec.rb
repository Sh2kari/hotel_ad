require 'spec_helper'
describe Comment do
  it 'user_id is not present' do
    @comment = Comment.create(user_id = nil)
    expect(@comment).not_to be_valid
  end

  it 'with blank body' do
    @comment = Comment.create(body: '')
    expect(@comment).not_to be_valid
  end

  it 'with content that is too long' do
    @comment = Comment.create(body: "a" * 141)
    expect(@comment).not_to be_valid
  end
end
