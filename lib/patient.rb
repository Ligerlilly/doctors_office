class Patient

  attr_accessor :id, :birthday, :doctor_id, :name

  def initialize(attributes)
    @birthday  = attributes.fetch :birthday
    @id        = attributes.fetch(:id).to_i
    @doctor_id = attributes.fetch(:doctor_id).to_i
    @name      = attributes.fetch :name
  end

  def self.all
    returned_pats = DB.exec("SELECT * FROM patients;")
    pats = []
    returned_pats.each do |pat|
      name = pat['name']
      id = pat['id']
      doctor_id = pat['doctor_id']
      birthday = pat['birthday']
      pats.push(Patient.new({ name: name, id: id, doctor_id: doctor_id, birthday: birthday }))
    end
    pats
  end


  def save
    result = DB.exec("INSERT INTO patients (birthday, doctor_id, name) VALUES ('#{self.birthday}', '#{self.doctor_id}', '#{self.name}') RETURNING id;")
    @id    = result.first.fetch('id').to_i
  end

  def ==(patient)
    self.name == patient.name &&
    self.birthday == patient.birthday &&
    self.id == patient.id && self.doctor_id == patient.doctor_id
  end

  def doc
    result = DB.exec("SELECT * FROM doctors WHERE id = '#{self.doctor_id}';")
    physicion = nil
    result.each do |doc|
      name = doc['name']
      id = doc['id']
      specialty_id = doc['specialty_id']
      physicion = Doctor.new({ name: name, id: id, specialty_id: specialty_id })
    end
    physicion
  end
end
