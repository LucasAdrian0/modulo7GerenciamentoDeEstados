import 'package:brasil_fields/brasil_fields.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pacotes/shared/widget/custon_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late var tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu App", style: GoogleFonts.roboto())),
      drawer: CustonDrawer(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(color: Colors.orange),
          Container(color: Colors.yellow),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                TextFormField(
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        {3: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Brasil'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
