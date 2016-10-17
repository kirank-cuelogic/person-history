class MeetUpTopicTest < ActiveSupport::TestCase
  test 'should get the meet up topics' do
    response = File.read(Rails.root + 'test/test_data/topics.json')
    stub_request(:get, "https://api.meetup.com/topics?key=#{Rails.application.secrets['meet_up_key']}&only=id,name,description,members&search=tech").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'}).
    to_return(:status => 200, :body => response,:headers => {})
    topics = MeetUpTopic.get_topics
    assert_equal JSON.parse(topics)['results'].length, 6
  end
end