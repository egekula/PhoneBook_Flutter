import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/data/repo/personsdao_repo.dart';

class SavePageCubit extends Cubit<void>{
  SavePageCubit() : super(0);

  var pRepo = PersonsDaoRepository();


  Future<void> Save(String person_name,String person_number) async {
    await pRepo.Save(person_name, person_number);
  }
}