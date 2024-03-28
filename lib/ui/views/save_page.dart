import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/ui/cubit/save_page_cubit.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Sayfası"),
      ),
      body:  Center(
        child: Padding(
          padding:  EdgeInsets.only(left: sizeScreen.height/14,right: sizeScreen.height/14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration: const InputDecoration(hintText: "Ad"),),
              TextField(controller: tfPersonNumber,decoration: const InputDecoration(hintText: "Telefon Numarası"),),
              ElevatedButton(
                  onPressed: (){
                    context.read<SavePageCubit>().Save(tfPersonName.text, tfPersonNumber.text);
                  },
                  child: const Text("Kaydet")),
            ],
          ),
        ),
      ),

    );

  }

}