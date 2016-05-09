class DefaultTest < DatabilityValidatorTest
  def test_default_validate_datability
    SampleModel.validates(:date, datability: true)

    valid_values = [
      @today,
      @today_as_string,
      @today_as_localized_string
    ]
    allow_valid(valid_values)

    invalid_values = ['2016-30-30', '01012016']
    disallow_invalid(
      invalid_values,
      I18n.t(:invalid, scope: [:errors, :messages])
    )
  end
end
