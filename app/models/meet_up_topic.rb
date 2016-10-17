class MeetUpTopic
  attr_accessor \
    :id,
    :name,
    :description,
    :members

  def initialize(args)
    args.each do |name,value|
      instance_variable_set("@#{name}",value)
    end
  end

  def self.get_topics
    HTTParty.get('https://api.meetup.com/topics',{query:{search:'tech',only:'id,name,description,members',key:Rails.application.secrets['meet_up_key']}})
  end

end