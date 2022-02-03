import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _campoAlcool = TextEditingController();
  TextEditingController _campoGasolina = TextEditingController();

  var _mensagemResultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu Carro",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool",
                ),
                style: TextStyle(fontSize: 20, color: Colors.grey),
                controller: _campoAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Preço Gasolina"),
                style: TextStyle(fontSize: 20, color: Colors.grey),
                controller: _campoGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  onPressed: () {
                    double valorAlcool = double.parse(_campoAlcool.text);
                    double valorGasolina = double.parse(_campoGasolina.text);

                    if(valorAlcool == null || valorGasolina == null){
                      setState(() {
                        _mensagemResultado = "Por favor, não coloque caracteres especiais";
                      });
                    }else{
                      calculaVantagemPreco(valorGasolina, valorAlcool);
                      limpeCampos();
                    }
                  },
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  _mensagemResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void limpeCampos() {
    _campoGasolina.text = "";
    _campoAlcool.text = "";
  }

  void calculaVantagemPreco(double valorGasolina, double valorAlcool) {
    if (valorAlcool/valorGasolina > 0.7) {
      setState(() {
        _mensagemResultado = "Compensa comprar Gasolina";
      });
    } else {
      setState(() {
        _mensagemResultado = "Compensa comprar Alcool";
      });
    }
  }
}
