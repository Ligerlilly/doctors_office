require 'spec_helper'

describe Doctor do

  before { @doctor =  Doctor.new({name: "Dr. Nick", speciality_id: 3, id: nil}) }

  describe '#id' do
    it 'should return the id of the doctor' do
      expect(@doctor.name).to eq 'Dr. Nick'
    end
  end

end
