module Doorkeeper
  class Application
    include MongoMapper::Document

    store_in = :oauth_applications

    key :name, :type => String
    key :uid, :type => String
    key :secret, :type => String
    key :redirect_uri, :type => String

    timestamps!

    def self.find_by_uid(uid)
      self.where(:uid => uid).first
    end

    def self.find_by_secret(secret)
      self.where(:secret => secret).first
    end

    def self.find_by_uid_and_secret(uid, secret)
      self.where(:uid => uid, :secret => secret).first
    end

    def self.authorized_for(resource_owner)
      ids = AccessToken.where(:resource_owner_id => resource_owner.id, :revoked_at => nil).map(&:application_id)
      find(ids)
    end
  end
end
