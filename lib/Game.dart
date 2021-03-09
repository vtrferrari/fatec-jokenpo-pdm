import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var imagens = AssetImage("images/padrao.png");
  var mensagem = 'Escolha uma das opções';

  void _opcaoSelecionada(String escolha) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numeros = Random().nextInt(3);
    var escolhaBot = opcoes[numeros];

    print("Escolha do usuario:" + escolha);
    print("Escolha do Computador:" + escolhaBot);

    switch (escolhaBot) {
      case "pedra":
        setState(() {
          this.imagens = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this.imagens = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this.imagens = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validação dos resultados

    //jogador ganha
    if ((escolha == 'pedra' && escolhaBot == 'tesoura') ||
        (escolha == 'tesoura' && escolhaBot == 'papel') ||
        (escolha == 'papel' && escolhaBot == 'pedra')) {
      setState(() {
        this.mensagem = 'Ganhou';
      });
    }
    //computador ganha
    else if ((escolhaBot == 'pedra' && escolha == 'tesoura') ||
        (escolhaBot == 'tesoura' && escolha == 'papel') ||
        (escolhaBot == 'papel' && escolha == 'pedra')) {
      setState(() {
        this.mensagem = 'Perdeu';
      });
    } else {
      setState(() {
        this.mensagem = 'Empatou';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jo-ken-po')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text('Escolha do Computador',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Image(
            image: this.imagens,
          ),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(this.mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(      
                      child: Text('Pedra', style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () => _opcaoSelecionada("pedra"),
                    ),RaisedButton(      
                      child: Text('Papel', style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () => _opcaoSelecionada("papel"),
                    ),RaisedButton(      
                      child: Text('Tesoura', style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () => _opcaoSelecionada("tesoura"),
                    ),],)
            ],
          )
    );
  }
}
