import 'package:phonebook_app/data/entity/persons.dart';
import 'package:phonebook_app/sqlite/veritabani_yardimcisi.dart';

class PersonsDaoRepository{
  Future<void> Save(String person_name,String person_number) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var newPerson = Map<String,dynamic>();
    newPerson["person_name"] = person_name;
    newPerson["person_number"] = person_number;
    await db.insert("Persons", newPerson);
  }
  Future<void> Update(int person_id,String person_name,String person_number) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var updatedPerson = Map<String,dynamic>();
    updatedPerson["person_name"] = person_name;
    updatedPerson["person_number"] = person_number;
    await db.update("Persons", updatedPerson,where: "person_id = ?",whereArgs: [person_id]);
  }
  Future <List<Persons>> LoadPersons() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Persons");
    return List.generate(maps.length, (index){
      var satir = maps[index];
      return Persons(person_id: satir["person_id"], person_name: satir["person_name"], person_number: satir["person_number"]);
    });
  }
  Future <List<Persons>> Search(String wordSearched) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Persons WHERE person_name like '%$wordSearched%'");
    return List.generate(maps.length, (index){
      var satir = maps[index];
      return Persons(person_id: satir["person_id"], person_name: satir["person_name"], person_number: satir["person_number"]);
    });
  }
  Future <void> Delete(int personID) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("Persons",where: "person_id = ?",whereArgs: [personID]);
  }
}