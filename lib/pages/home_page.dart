import 'package:flutter/material.dart';
import 'package:pacotes/shared/widget/custon_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Meu App")),
        drawer: CustonDrawer(),
        body: Column(
          children: [
            Expanded(                  
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
