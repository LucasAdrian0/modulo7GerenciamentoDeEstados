import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pacotes/pages/auto_size_text.dart';
import 'package:pacotes/pages/percent_indicator.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text("Camera"),
                        leading: Icon(Icons.camera_alt),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text("Galeria"),
                        leading: Icon(Icons.photo),
                      ),
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  "http://hermes.digitalinnovation.one/assets/diome/logo.png",
                ),
              ),
              accountName: Text("Lucas Adriano"),
              accountEmail: Text("email@email.com"),
            ),
          ),
          InkWell(
            //abrir dio
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.internetExplorer,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Abrir dio"),
                ],
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            //Abrir Google Maps
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.mapLocation,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Abrir Google Maps"),
                ],
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            //Compartilhar
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.shareNodes,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Compartilhar"),
                ],
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            // Indicador de Porcentagem
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.percent,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Indicador de Porcentagem"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PercentIndicatorPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.paperclip,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Auto Size Text"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AutoSizeTextPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
