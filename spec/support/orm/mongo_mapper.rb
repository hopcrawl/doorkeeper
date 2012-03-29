MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = "doorkeeper-test-suite"

DatabaseCleaner[:mongo_mapper].strategy = :truncation
DatabaseCleaner[:mongo_mapper].clean_with :truncation
