class Specialty

  attr_reader :id, :specialty

  def initialize(attributes)
    @id         = attributes.fetch(:id).to_i
    @speciality = attributes.fetch :specialty
  end


  def self.find (specialty_id)
    returned_specialties = DB.exec("SELECT * FROM specialties WHERE id = #{specialty_id}")
    specialty = nil
    returned_specialties.each do |spec|
      id         = spec.fetch 'id'
      specialty = spec.fetch 'specialty'
      specialty  = Specialty.new({id: id, specialty: specialty})
    end
    specialty
  end
end

#
#
# Specialty.find(doctor.specialty_id)
#
#   return specialty
