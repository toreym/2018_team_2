class AppSetting < ApplicationRecord

  def self.get_setting(name, default:)
    setting = self.find_by_setting(name)
    return default if setting.nil?

    # try to cast to the type of the default
    if setting and default
      begin
        val = default.class(setting)
        return val
      rescue Exception => e
        return default
      end
    end
  end

end
