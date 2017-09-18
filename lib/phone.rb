class Phone
  def initialize(attributes)
    @phone_type = attributes.fetch(:phone_type)
    @phone_number = attributes.fetch(:phone_number)
  end
