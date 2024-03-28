import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/data/repo/personsdao_repo.dart';

class DetailsPageCubit extends Cubit<void>{
  DetailsPageCubit():super(0);

  var pRepo = PersonsDaoRepository();

  Future<void> Update(int person_id,String person_name,String person_number) async {
    await pRepo.Update(person_id, person_name, person_number);
  }
}