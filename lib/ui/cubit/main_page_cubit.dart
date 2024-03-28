import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/data/entity/persons.dart';
import 'package:phonebook_app/data/repo/personsdao_repo.dart';

class MainPageCubit extends Cubit<List<Persons>>{

  MainPageCubit() : super(<Persons>[]);

  var pRepo = PersonsDaoRepository();

  Future <void> LoadPersons() async {
    var list = await pRepo.LoadPersons();
    emit(list);
  }
  Future <void> Search(String wordSearched) async {
    var list = await pRepo.Search(wordSearched);
    emit(list);
  }
  Future <void> Delete(int personID) async {
    await pRepo.Delete(personID);
    await LoadPersons();
  }
}