require 'spec_helper'


describe Patient do

  before do
    @patient = Patient.new({id: nil, name: "Col. Sanders", doctor_id: 1, birthday: '1801-01-23' })
  end

  describe '#id' do
    it 'should return the id of the patient' do
      expect(@patient.id).to eq 0
    end
  end

  describe '#name' do
    it 'should return the name of the patient' do
      expect(@patient.name).to eq 'Col. Sanders'
    end
  end

  describe '#doctor_id' do
    it 'should return the doctor_id of the patient' do
      expect(@patient.doctor_id).to eq 1
    end
  end

  describe '#birthday' do
    it 'should return the birthday of the patient' do
      expect(@patient.birthday).to eq "1801-01-23"
    end
  end

  describe '.all' do
    it 'returns an empty array at first' do
      expect(Patient.all).to eq []
    end
  end

  describe '#save' do
    it 'should save the patient to the db' do
      @patient.save
      expect(Patient.all).to eq [@patient]
    end
  end

  describe '#==' do
    it 'should return true when a patients attributes match anothers' do
      patient2 = Patient.new({id: nil, name: "Col. Sanders", doctor_id: 1, birthday: '1801-01-23' })
      expect(patient2).to eq @patient
    end
  end

  describe "#doc" do
    it 'returns an associated doctor' do
      doctor = Doctor.new({name: "Dr. Nick", specialty_id: '3', id: nil})
      doctor.save
      @patient.doctor_id = doctor.id
      expect(@patient.doc).to eq doctor
    end
  end

  describe '.find' do
    it 'should return a patient by its id' do
      @patient.save
      expect(Patient.find(@patient.id)).to eq @patient
    end
  end



end
