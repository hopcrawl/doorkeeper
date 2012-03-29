module Doorkeeper
  class AccessGrant
    include MongoMapper::Document

    store_in = :oauth_access_grants

    key :resource_owner_id, :type => Hash
    key :application_id, :type => Hash
    key :token, :type => String
    key :expires_in, :type => Integer
    key :redirect_uri, :type => String
    key :revoked_at, :type => DateTime
    key :scopes, :type => String
    
    timestamps!

    def self.find_by_token(token)
      where(:token => token).first
    end
  end
end
