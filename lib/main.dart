import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_app/ui/cubit/details_page_cubit.dart';
import 'package:phonebook_app/ui/cubit/main_page_cubit.dart';
import 'package:phonebook_app/ui/cubit/save_page_cubit.dart';
import 'package:phonebook_app/ui/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SavePageCubit()),
        BlocProvider(create: (context) =>DetailsPageCubit()),
        BlocProvider(create: (context) =>MainPageCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}

