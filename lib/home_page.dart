import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // controlar el tamaño de la imagen
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.25, // 1/4 de la pantalla
                child: ClipRRect( // para el borde circular
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/balibeach.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, //5 elementos. 5 dias
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(index: index);
                        },
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return MaterialButton(
                          onPressed: () {
                            // mostrar snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Reservación en progreso"),
                              ),
                            );
                          },
                          child: Text("Start booking"),
                          color: Colors.red,
                          textColor: Colors.grey[200], //cambio de color
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
