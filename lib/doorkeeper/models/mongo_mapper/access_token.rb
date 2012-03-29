module Doorkeeper
  class AccessToken
    include MongoMapper::Document

    store_in = :oauth_access_tokens

    key :resource_owner_id, :type => Integer
    key :token, :type => String
    key :refresh_token, :type => String
    key :expires_in, :type => Integer
    key :revoked_at, :type => DateTime
    key :scopes, :type => String

    timestamps!

    def self.find_by_token(token)
      where(:token => token).first
    end

    def self.find_by_refresh_token(refresh_token)
      where(:refresh_token => refresh_token).first
    end
  end
end
