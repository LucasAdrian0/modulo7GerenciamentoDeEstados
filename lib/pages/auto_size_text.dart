import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Auto Size Text")),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            child: Text(
              "O cuidado em identificar pontos críticos no desafiador cenário globalizado não pode mais se dissociar do sistema de formação de quadros que corresponde às necessidade",
            ),
          ),
        ),
      ),
    );
  }
}
