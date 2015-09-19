require 'spec_helper'

describe Hotel do
  it 'create valid hotel' do
    @hotel = Hotel.create(title: 'Title', room_description: 'Black hole',
                          breakfast: 'yes', price: '666')
    expect(@hotel).to be_valid
  end

  it 'create hotel without title' do
    @hotel = Hotel.create(title: '', room_description: 'Black hole',
                          breakfast: 'yes', price: '666')
    expect(@hotel).not_to be_valid
  end

  it 'create hotel without room_description' do
    @hotel = Hotel.create(title: 'Title', room_description: '',
                          breakfast: 'yes', price: '666')
    expect(@hotel).not_to be_valid
  end

  it 'create hotel without breakfast' do
    @hotel = Hotel.create(title: 'Title', room_description: 'Black Hole',
                          breakfast: '', price: '666')
    expect(@hotel).not_to be_valid
  end

  it 'create hotel without price' do
    @hotel = Hotel.create(title: 'Title', room_description: 'Black Hole',
                          breakfast: 'no', price: '')
    expect(@hotel).not_to be_valid
  end

  it 'create hotel with long title' do
    @hotel = Hotel.create(title: "a" * 51, room_description: 'Black Hole',
                          breakfast: 'no', price: '666')
    expect(@hotel).not_to be_valid
  end
end
