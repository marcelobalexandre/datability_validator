class DateLocalizer
  def self.localize(value)
    valid_for_localization?(value) ? value.strftime(localized_format) : value
  end

  private

  def self.valid_for_localization?(value)
    value.respond_to?(:strftime)
  end
  private_class_method :valid_for_localization?

  def self.localized_format
    I18n.t(:default, scope: [:date, :formats])
  end
  private_class_method :localized_format
end
