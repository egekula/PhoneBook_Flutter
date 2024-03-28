import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/data/entity/persons.dart';
import 'package:phonebook_app/ui/cubit/main_page_cubit.dart';
import 'package:phonebook_app/ui/views/details_page.dart';
import 'package:phonebook_app/ui/views/save_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainPageCubit>().LoadPersons();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: isSearched ?
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
          onChanged: (result){
            context.read<MainPageCubit>().Search(result);
          },
        ) :
        const Text("Kişiler"),
        actions: [ isSearched ?
          IconButton(onPressed: (){
            setState(() {
              isSearched = false;
            });
            context.read<MainPageCubit>().LoadPersons();
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: (){
              setState(() {
                isSearched = true;
              });
          }, icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<MainPageCubit,List<Persons>>(
        builder: (context,personList){
          if(personList.isNotEmpty){
            return ListView.builder(
                itemCount: personList.length,
                itemBuilder: (context,index){
                  var person = personList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(person: person))).
                      then((value){
                        context.read<MainPageCubit>().LoadPersons();
                      });
                    },
                    child: Card(
                      child: SizedBox(height: sizeScreen.height/8 ,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(person.person_name,style: TextStyle(fontSize: sizeScreen.height/41),),
                                  Text(person.person_number,style: TextStyle(fontSize: sizeScreen.height/50),)
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("${person.person_name} silinsin mi?"),
                                        action: SnackBarAction(
                                            label: "Evet",
                                            onPressed: (){
                                              context.read<MainPageCubit>().Delete(person.person_id);
                                            }) ,
                                    )
                                  );
                                },
                                icon: Icon(Icons.clear),color: Colors.black54,)
                          ],
                        ),
                      ),
                    ),
                  );
                },

            );
          }
          else{
            return const Center(
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SavePage())).
          then((value){
            context.read<MainPageCubit>().LoadPersons();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
