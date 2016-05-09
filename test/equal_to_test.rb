class EqualToTest < DatabilityValidatorTest
  def test_equal_to_with_proc
    [@today, @today_as_string, @today_as_localized_string].each do |today|
      SampleModel.validates(
        :date,
        datability: { equal_to: Proc.new { today } }
      )

      valid_values = [
        @today,
        @today_as_string,
        @today_as_localized_string
      ]
      allow_valid(valid_values)

      invalid_values = [
        @yesterday,
        @yesterday_as_string,
        @yesterday_as_localized_string,
        @tomorrow,
        @tomorrow_as_string,
        @tomorrow_as_localized_string
      ]
      disallow_invalid(
        invalid_values,
        I18n.t(
          :equal_to,
          scope: [:errors, :messages],
          count: @today_as_localized_string
        )
      )
    end
  end

  def test_equal_to_with_symbol
    [@today, @today_as_string, @today_as_localized_string].each do |today|
      begin
        SampleModel.send(:define_method, :another_date, -> { today })

        SampleModel.validates(
          :date,
          datability: { equal_to: :another_date }
        )

        valid_values = [
          @today,
          @today_as_string,
          @today_as_localized_string
        ]
        allow_valid(valid_values)

        invalid_values = [
          @yesterday,
          @yesterday_as_string,
          @yesterday_as_localized_string,
          @tomorrow,
          @tomorrow_as_string,
          @tomorrow_as_localized_string
        ]
        disallow_invalid(
          invalid_values,
          I18n.t(
            :equal_to,
            scope: [:errors, :messages],
            count: 'Another date'
          )
        )
      ensure
        SampleModel.send(:remove_method, :another_date)
      end
    end
  end
end
