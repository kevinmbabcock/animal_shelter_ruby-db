class Animal
  attr_accessor(:name, :gender, :date_admitted, :type, :breed)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @date_admitted = attribtues.fetch(:date_admitted)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end
