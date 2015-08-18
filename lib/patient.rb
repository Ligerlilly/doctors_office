class Patient

  attr_reader :id, :birthday, :doctor_id, :name

  def initialize(attributes)
    @birthday  = attributes.fetch :birthday
    @id        = attributes.fetch(:id)
    @doctor_id = attributes.fetch :doctor_id
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
end
