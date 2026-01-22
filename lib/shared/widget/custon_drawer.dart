import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pacotes/pages/auto_size_text.dart';
import 'package:pacotes/pages/battery_page/battery_page.dart';
import 'package:pacotes/pages/percent_indicator/percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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
          //Abrir dio
          InkWell(
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
            onTap: () async {
              await launchUrl(Uri.parse('https://dio.me'));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Abrir Google Maps
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.mapLocationDot,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Abrir Google Maps"),
                ],
              ),
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://www.google.com/maps'));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Compartilhar
          InkWell(
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
            onTap: () {
              SharePlus.instance.share(
                ShareParams(text: 'Olhem este site https://dio.me'),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          // Indicador de Porcentagem
          InkWell(
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
          //Auto Size Text
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
          const Divider(),
          const SizedBox(height: 10),
          //Intl
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Intl"),
                ],
              ),
            ),
            onTap: () {
              var f = NumberFormat('#,###.0#', 'en_US');
              var fBR = NumberFormat('#,###.0#', 'pt_BR');
              print(f.format(12345.345));
              print(fBR.format(123456.345));

              var data = DateTime(2022, 05, 09);
              print(DateFormat('EEEEE', 'pt_BR').format(data));
              print(DateFormat('EEEEE', 'en_US').format(data));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //pt-br
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.flag, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("pt-br"),
                ],
              ),
            ),
            onTap: () {
              if (context.locale.toString() == "pt-BR") {
                context.setLocale(Locale('en', 'US'));
              } else {
                context.setLocale(Locale('pt', 'BR'));
              }
              print(context.locale.toString());
              Navigator.pop(context);
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Battery
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Battery"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BatteryPage()),
              );
            },
          ),
          //Path_provider compartilhamento de dados (File)
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Path"),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
