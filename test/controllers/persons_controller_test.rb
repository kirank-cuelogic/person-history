class PersonsControllerTest < ActionController::TestCase
  test 'should return all persons' do
    get :index
    assert_response :success
    assert_not_nil response.body
  end
end