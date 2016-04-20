class UserProjectPreference < ActiveRecord::Base
  include Preferences

  preferences_for :project

  def summated_activity_count
    if legacy_count.blank?
      activity_count
    else
      valid_legacy_count_values.reduce(:+)
    end
  end

  private

  def valid_legacy_count_values
    legacy_count.values.compact.map(&:to_i)
  end
end
