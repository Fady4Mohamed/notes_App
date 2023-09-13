import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/cubit/localBlocOpserver.dart';
import 'package:note_app/cubits/cubit/notescubit/notes_cubit.dart';
import 'package:note_app/views/notespage.dart';

import 'cubits/cubit/editcubit/edit_cubit.dart';
import 'model/noteModel.dart';

void main() async {
  Bloc.observer = localBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(noteModelAdapter());
  await Hive.openBox<noteModel>('thebox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => EditCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const notespage(),
      ),
    );
  }
}
