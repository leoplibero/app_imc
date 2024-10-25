import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: Imc(),debugShowCheckedModeBanner: false,));
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {

  TextEditingController pesocontroller = TextEditingController();
  TextEditingController alturacontroller = TextEditingController();
  String infor = "Informe seus dados";

  void resetCampos(){
    pesocontroller.text = "";
    alturacontroller.text = "";
    infor = "Informe seus dados";
  }

  void _calcular() {
    setState(() {
      double weight = double.parse(pesocontroller.text);
      double height = double.parse(alturacontroller.text) / 100;
      double imc = weight / (height * height);
      //print(imc);
      if (imc < 18.5) {
        infor = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        infor = "Peso normal(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        infor = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        infor = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else {
        infor = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 7, 121, 12),
          actions: [
            IconButton(
                onPressed: () {
                  resetCampos();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
      
      body:Container(
        padding: EdgeInsets.all(16),
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_outline,size: 120, color: Color.fromARGB(255, 228, 139, 194),),
          TextField( 
            controller: pesocontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)"
            ),
            textAlign: TextAlign.center,
          ),

          TextField( 
            controller: alturacontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (cm)"
            ),
            textAlign: TextAlign.center,
            ),

            SizedBox(height: 24,),

            ElevatedButton(
              onPressed: _calcular, 
              child: Text("Calcular"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 110, 20)
              ),
              ),
              
              SizedBox(height: 24,),

              Text(infor,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 218, 55, 177), fontSize: 25),)
        ],
      ),
      )
    );
  }
}