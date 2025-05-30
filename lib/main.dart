import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Imc(), debugShowCheckedModeBanner: false));
}

class Imc extends StatefulWidget {

  const Imc({super.key});
  @override
  State<Imc> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Imc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infor = "Informe seus dados";

  void resetCampos(){
    setState(() {
     pesoController.text = "";
    alturaController.text = "";
    infor = "informe seus dados"; 
    });
    
  }
  void calcular(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / (altura * peso);

  if(imc < 18.5){
    infor = "Abaixo do peso(${imc.toStringAsPrecision(3)})";
  }else if(imc >= 18.5 && imc <= 24.9){
    infor = "peso normal (${imc.toStringAsPrecision(3)})";
  }else if(imc >= 25.0 && imc <= 29.9){
    infor = "sobrepeso (${imc.toStringAsPrecision(3)})";
  }else if (imc >= 30.0 && imc <= 34.9){
    infor = "obesidade grau 1 (${imc.toStringAsPrecision(3)})";
  }else{
    infor = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
  }
  
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
         actions:[IconButton(onPressed:resetCampos, icon: Icon(Icons.refresh))],
      ),

      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.person_outline, size: 120, color: Colors.green),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ),

            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (Cm)",
                labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ),

            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, textStyle: TextStyle(color: Colors.white, fontSize: 25)),
              child: Text("Calcular"),
            ),

            Text(infor,
            textAlign: TextAlign.center,
            style: TextStyle(color:Colors.green, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}