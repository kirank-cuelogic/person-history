class PersonTest < ActiveSupport::TestCase
  test 'should initilize person' do
    person_params = {first_name:'Hetal' , last_name: 'Pandya' ,"father_name":"Chetan Patil","mother_name":"Manorma Patil","gender":"Female","blood_group":"o postive","number_of_f_membrs":"7"}
    @person = Person.new(person_params)
    assert_includes @person.as_json.values, 'Hetal' 
  end

end