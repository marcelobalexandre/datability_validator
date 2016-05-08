require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'

require 'active_model'
require 'active_support/all'
require 'datability_validator'

I18n.enforce_available_locales = false
I18n.default_locale = :en
I18n.locale = :en
I18n.load_path << Dir[File.expand_path('../locale/*.yml', __FILE__)]

Time.zone = 'Eastern Time (US & Canada)'

class SampleModel
  include ActiveModel::Validations

  attr_accessor :date, :another_date

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end
end
