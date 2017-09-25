require 'rails_helper'

RSpec.describe Reservation, :type => :model do
  subject {
     described_class.new(email: "1234@test.de", name: "Franz Joseph",
                          start_time: DateTime.now, end_time: DateTime.now + 1.week)
   }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a start_time" do
    subject.start_time = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a end_time" do
    subject.end_time = nil
    expect(subject).to_not be_valid
  end
#  it "is not valid when start_time is after end_time" do
#    subject.start_time > subject.end_time
#    expect(subject).to_not be_valid
#  end
end


# run test rspec spec/models/reservation_spec.rb
