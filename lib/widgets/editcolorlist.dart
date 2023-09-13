import 'package:flutter/material.dart';
import 'package:note_app/model/noteModel.dart';

import 'colorcontainer.dart';

class editcolorlist extends StatefulWidget {
  const editcolorlist(
      {super.key, required this.initialcolor, required this.note});
  final noteModel note;
  final int initialcolor;
  @override
  State<editcolorlist> createState() => _editcolorlistState();
}

class _editcolorlistState extends State<editcolorlist> {
  late int indexofchecea;

  final List<Color> Listofcolors = const [
    Color(0xff8E3B46),
    Color(0xffE1DD8F),
    Color(0xffE0777D),
    Color(0xff4C86A8),
    Color(0xff477890),
    Color.fromARGB(255, 103, 182, 7),
  ];
  @override
  void initState() {
    indexofchecea = Listofcolors.indexOf(Color(widget.initialcolor));
    super.initState();
  }

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
                widget.note.color = Listofcolors[index].value;
                indexofchecea = index;
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
