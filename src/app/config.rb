ENV = :development   # This variable governs all config

class Config

  attr_accessor :keys, :env

  def initialize(env=:production)
    @env = env

    @keys = {
      :production => {
          :debug => false,
          :scheme => "http://",
          :domain => "yobitch.me",
          :user_get => "/user_post.json",
          :user_save => "/api/v1/users",
          :user_post => "/api/v1/users/send_message",
          :message_send => "/api/v1/users/send_message",
          :add_friend => "/api/v1/users/add_friend",
          :sync_contacts => "/api/v1/users/sync_contacts",
          :add_bitch_message => "/api/v1/users/add_message",
          :gcm_sender_id => "77573904884",
          :package_name => "com.rum.yobitch",
          :admob_ad_unit_id => "ca-app-pub-4205525304773174/8192109240",
          :appnext_ad_placement_id => "e72fda13-b2be-49f2-bf21-f9822f8a229f",
          :ga_tracking_id => "UA-52998741-1",
          :bugsense_id => "bc7fb570"
        },
        :development => {
          :debug => true,
          :scheme => "http://",
          :domain => "yobitch.me",
          :user_get => "/user_post.json",
          :user_save => "/api/v1/users",
          :user_post => "/api/v1/users/send_message",
          :message_send => "/api/v1/users/send_message",
          :add_friend => "/api/v1/users/add_friend",
          :sync_contacts => "/api/v1/users/sync_contacts",
          :add_bitch_message => "/api/v1/users/add_message",
          :gcm_sender_id => "77573904884",
          :package_name => "com.rum.yobitch",
          :admob_ad_unit_id => "ca-app-pub-4205525304773174/8192109240",
          :appnext_ad_placement_id => "e72fda13-b2be-49f2-bf21-f9822f8a229f",
          :ga_tracking_id => "UA-52998741-1",
          :bugsense_id => "bc7fb570"
        }
    }
  end


  # General purpose getter
  def get(key)
    return @env if key == :env

    value = @keys[@env][key]
    raise("Invalid config requested") if value.nil?

    return value
  end

end

# Global object to be used everywhere
CONFIG = Config.new(ENV)
