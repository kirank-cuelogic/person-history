require 'fetch_person'
class Person 
  attr_accessor \
    :first_name, 
    :last_name, 
    :gender, 
    :father_name, 
    :mother_name, 
    :number_of_f_membrs,
    :blood_group


  def initialize(args)
    args.each do |name,value|
      instance_variable_set("@#{name}",value)
    end
  end

  def self.all
    persons = $redis.get('persons')
    if persons.nil?
      persons = []
      FetchPerson.get_person.try(:each) do |person_params|
        persons << Person.new(person_params)
      end
      $redis.set('persons',persons.as_json)
    end
    persons
  end

end