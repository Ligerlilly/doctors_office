class Patient

  attr_reader :id, :birthday, :doctor_id, :name

  def initialize(attributes)
    @birthday  = attributes.fetch :birthday
    @id        = attributes.fetch(:id)
    @doctor_id = attributes.fetch :doctor_id
    @name      = attributes.fetch :name
  end
end
