require 'spec_helper'


describe Patient do

  before do
    @patient = Patient.new({id: nil, name: "Col. Sanders", doctor_id: 3, birthday: '1801-1-23' })
  end


  describe '#id' do
    it 'should return the id of the patient' do
      expect(@patient.id).to eq nil
    end
  end

  describe '#name' do
    it 'should return the name of the patient' do
      expect(@patient.name).to eq 'Col. Sanders'
    end
  end

  describe '#doctor_id' do
    it 'should return the doctor_id of the patient' do
      expect(@patient.doctor_id).to eq 3
    end
  end

  describe '#birthday' do
    it 'should return the birthday of the patient' do
      expect(@patient.birthday).to eq "1801-1-23"
    end
  end

  describe '.all' do
    it 'returns an empty array at first' do
      expect(Patient.all).to eq []
    end
  end
end
