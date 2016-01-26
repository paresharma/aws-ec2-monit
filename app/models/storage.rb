class Storage
  MONGO_INSTANCE = '127.0.0.1:27017'
  DB = 'status'
  CLIENT = Mongo::Client.new("mongodb://#{MONGO_INSTANCE}/#{DB}")

  def push args
    args['data'] = JSON.parse args['data']
    CLIENT["ec2"].insert_one args['data']
  end

  def get_result
    db = CLIENT.database
    instances = db['ec2'].distinct('instance_id')

    result = []
    instances.each do |i|
      r = db['ec2'].find(instance_id: i).sort(time: -1).first
      result << r.to_hash
    end
    result
  end
end
