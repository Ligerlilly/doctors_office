require 'sinatra'
require 'sinatra/reloader'
require './lib/doctor'
require './lib/patient'
require './lib/specialty'
require 'pg'
require 'pry'

DB = PG.connect({dbname: 'doctors' })

get '/' do
	@doctors = Doctor.all
	erb :index
end

# Index action for patients
get '/patients' do
	@patients = Patient.all
	erb :patients
end

# Index action for doctors
get '/doctors' do
	@doctors = Doctor.all
	erb :doctors
end

# Create action for doctors
get '/doctors/new' do
	erb :doctors_form
end

# Create action for patients
get '/patients/new' do
	@doctors = Doctor.all
	erb :patients_form
end

# render individual patient page
get '/patient/:id' do
	@patient = Patient.find(params['id'].to_i)
	@doctor = @patient.doc
	erb :patient
end

# render individual patient page
get '/doctor/:id' do
	@doctor = Doctor.find(params['id'])
	@specialty = Specialty.find(@doctor.specialty_id)
	erb :doctor
end

# Creates a new doctor
post '/doctors' do
  @doctor = Doctor.new(specialty_id: params['specialty'], name: params['name'], id: nil)
	@doctor.save
	@specialty = Specialty.find(params['specialty'])
	erb :doctor
end

# Creates a new patient
post '/patients' do
	name = params['name']
	doctor_id = params['doctor_id']
	birthday = params['birthday']
	@patient = Patient.new({name: name, birthday: birthday, id: nil, doctor_id: doctor_id})
	@patient.save
	@doctor = Doctor.find(params['doctor_id'].to_i)
	erb :patient
end
