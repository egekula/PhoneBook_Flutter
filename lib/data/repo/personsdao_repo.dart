import 'package:phonebook_app/data/entity/persons.dart';

class PersonsDaoRepository{
  Future<void> Save(String person_name,String person_number) async {
    print("$person_name - $person_number");
  }
  Future<void> Update(int person_id,String person_name,String person_number) async {
    print("$person_id-$person_name - $person_number");
  }
  Future <List<Persons>> LoadPersons() async {
    var personsList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: "James", person_number: "1111");
    var p2 = Persons(person_id: 2, person_name: "Anna", person_number: "2222");
    var p3 = Persons(person_id: 3, person_name: "Jamal", person_number: "3333");
    personsList.add(p1);
    personsList.add(p2);
    personsList.add(p3);
    return personsList;
  }
  Future <List<Persons>> Search(String wordSearched) async {
    var personsList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: "James", person_number: "1111");
    personsList.add(p1);
    return personsList;
  }
  Future <void> Delete(int personID) async {
    print("$personID");
  }
}