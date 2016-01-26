class Storage
  MONGO_INSTANCE = '127.0.0.1:27017'
  DB = 'status'
  CLIENT = Mongo::Client.new("mongodb://#{MONGO_INSTANCE}/#{DB}")

  def push args
    CLIENT["ec2"].insert_one args['data']
  end
end
