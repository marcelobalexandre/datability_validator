class SampleModel
  include ActiveModel::Validations

  attr_accessor :date

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end
end
