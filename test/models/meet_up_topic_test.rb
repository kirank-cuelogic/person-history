class MeetUpTopicTest < ActiveSupport::TestCase
  test 'should get the meet up topics' do
    response = File.read(Rails.root + 'test/test_data/topics.json')
    stub_request(:get, "https://api.meetup.com/topics?key=430473354567f7a2917273b48793a&only=id,name,description,members&search=tech").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => response, :headers => {})
    assert_equal JSON.parse(response)['results'].length, 6
  end
end