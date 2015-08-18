require 'spec_helper'

describe Doctor do

  before do
    @doctor =  Doctor.new({name: "Dr. Nick", specialty_id: '3', id: nil})
  end

  describe '#name' do
    it 'should return the id of the doctor' do
      expect(@doctor.name).to eq 'Dr. Nick'
    end
  end

  describe '.all' do
    it 'returns an empty array at first' do
      expect(Doctor.all).to eq []
    end
  end


  describe '#id' do
    it 'returns the id of the doctor' do
      expect(@doctor.id).to eq nil
    end
  end


  describe '#specialty_id' do
    it 'returns the specialty id of the doctor' do
      expect(@doctor.specialty_id).to eq  3
    end
  end


  describe('#save') do
    it 'should save the doctor to the database' do
      @doctor.save
      expect(Doctor.all).to eq [@doctor]
    end
  end

  describe '#==' do
    it 'should return true if the doctors have the same name, specialty_id and id' do
      doctor2 = Doctor.new({ name: 'Dr. Nick', specialty_id: 3, id: nil })
      expect(@doctor).to eq doctor2
    end
  end

  describe '.find' do
    it 'should return a doctor by its id' do
      @doctor.save
      expect(Doctor.find(@doctor.id)).to eq @doctor
    end
  end

end
