import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/data/entity/persons.dart';
import 'package:phonebook_app/ui/cubit/details_page_cubit.dart';

class DetailsPage extends StatefulWidget {
  Persons person;


  DetailsPage({required this.person});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.person_name;
    tfPersonNumber.text = person.person_number;
  }
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detay Sayfası"),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: sizeScreen.height/14,right: sizeScreen.height/14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration: const InputDecoration(hintText: "Ad"),),
              TextField(controller: tfPersonNumber,decoration: const InputDecoration(hintText: "Telefon Numarası"),),
              ElevatedButton(
                  onPressed: (){
                    context.read<DetailsPageCubit>().Update(widget.person.person_id, tfPersonName.text, tfPersonNumber.text);
                  },
                  child: const Text("Güncelle")),
            ],
          ),
        ),
      ),
    );
  }

}