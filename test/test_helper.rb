require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'

require 'active_model'
require 'active_support/core_ext/time/zones'
require 'active_support/core_ext/time/conversions'
require 'active_support/core_ext/date/conversions'
require 'active_support/core_ext/numeric/time'

require 'datability_validator'

require 'models/sample_model'

I18n.enforce_available_locales = false
I18n.default_locale = :en
I18n.locale = :en
I18n.load_path << Dir[File.expand_path('../locales/*.yml', __FILE__)]

Time.zone = 'Eastern Time (US & Canada)'
