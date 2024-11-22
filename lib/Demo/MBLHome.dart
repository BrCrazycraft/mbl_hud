import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbl_hud/Demo/MBLExemple.dart';
import 'package:mbl_hud/Roulette/Roulette.dart';
import 'package:mbl_hud/Roulette/RouletteResource.dart';

class MblExempleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Roulette(
        height: 256,
        background: Color.fromRGBO(255, 255, 255, 0.5),
        backButtonIcon: Icon(Icons.arrow_back, color: Colors.white,),
        frontButtonIcon: Icon(Icons.arrow_forward, color: Colors.white,),
        buttonStyle: ButtonStyle(),
        audio: MblExempleHomeAudio(),
        children: <RouletteResource>[
          RouletteResource(
              details: MblExempleHomeDetails(title: "Titulo de exemplo", description: "Demonstração de uma janela de destaque"),
              videoContent: MblExempleHomeVideo(),
              videoThumbnail: Image.network("https://images8.alphacoders.com/132/1326094.jpeg", fit: BoxFit.cover,)
          ),
          RouletteResource(
              details: MblExempleHomeDetails(title: "Melhor personagem", description: "Melhor personagem do anime."),
              videoContent: MblExempleHomeVideo(),
              videoThumbnail: Image.network("https://images6.alphacoders.com/130/1303257.png", fit: BoxFit.cover,)
          ),
          RouletteResource(
              details: MblExempleHomeDetails(title: "Kaido", description: "Kaido é um dos Quatro Imperadores do mar em One Piece, conhecido como \"A besta mais forte do mundo\". Líder dos Piratas das Feras, busca dominar o mundo criando um exército imbatível e planeja usar a força dos \"Smiles\" para conquistar a supremacia."),
              videoContent: MblExempleHomeVideo(),
              videoThumbnail: Image.network("https://images8.alphacoders.com/130/1305169.jpeg", fit: BoxFit.cover,)
          )
        ],
    );
  }
}

