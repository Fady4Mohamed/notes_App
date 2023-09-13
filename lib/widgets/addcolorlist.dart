import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/add_note_cubit.dart';
import 'colorcontainer.dart';

class addcolorlist extends StatefulWidget {
  const addcolorlist({
    super.key,
  });

  @override
  State<addcolorlist> createState() => _addcolorlistState();
}

class _addcolorlistState extends State<addcolorlist> {
  int indexofchecea = 0;

  final List<Color> Listofcolors = const [
    Color(0xff8E3B46),
    Color(0xffE1DD8F),
    Color(0xffE0777D),
    Color(0xff4C86A8),
    Color(0xff477890),
    Color.fromARGB(255, 103, 182, 7),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Listofcolors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                indexofchecea = index;
                BlocProvider.of<AddNoteCubit>(context).colorselected =
                    Listofcolors[index].value;
                setState(() {});
              },
              child: colorContainer(
                color: Listofcolors[index],
                isselected: indexofchecea == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
