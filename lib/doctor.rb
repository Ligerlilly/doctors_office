class Doctor
  attr_reader :name, :id, :specialty_id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @specialty_id = attributes[:specialty_id].to_i
  end

  def self.all
    doctors          = []
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    returned_doctors.each do |doctor|
      id            = doctor.fetch 'id'
      name          = doctor.fetch 'name'
      specialty_id  = doctor.fetch 'specialty_id'
      doctors.push(Doctor.new({id: id, name: name, specialty_id: specialty_id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{self.name}', #{self.specialty_id}) RETURNING id;")
    @id    = result.first.fetch 'id'
  end

  def == (another_doctor)
    another_doctor.id           == self.id &&
    another_doctor.name         == self.name &&
    another_doctor.specialty_id == self.specialty_id
  end

  def self.find(doc_id)
    found_doctor = nil
    returned_doctors = DB.exec("SELECT * FROM doctors WHERE id = #{doc_id};")
    returned_doctors.each do |doc|
      if doc['id'] == doc_id
        found_doctor = Doctor.new({ name: doc['name'], specialty_id: doc['specialty_id'], id: doc['id'] })
      end
    end

    found_doctor
  end



end
