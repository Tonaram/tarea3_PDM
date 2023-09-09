import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int index; //para que cada item sea diferente

  ItemActividad({required this.index, Key? key}) : super(key: key);

  final List<String> placeNames = [ //para los nombres de cada lugar
    "Mount batur",
    "Uluwatu Temple",
    "Rice Terraces",
    "Sekumpul Waterfall",
    "Ubud Monkey Forest",
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/bali$index.jpg'), //las imagenes son bali0 a bali4
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Day ${index + 1}", style: TextStyle(fontSize: 11)), // dia 1 a 5
          Text(placeNames[index]),
        ],
      ),
    );
  }
}
