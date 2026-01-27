import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.camera),
                          title: Text("Camera"),
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera,
                            );
                          },
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.images),
                          title: Text("Galeria"),
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (photo != null) {
                              String path =
                                  (await path_provider
                                          .getApplicationDocumentsDirectory())
                                      .path;
                              String name = basename(photo.path);
                              await photo.saveTo("$path/$name");
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },

              child: Text("Camera"),
            ),
          ],
        ),
      ),
    );
  }
}
