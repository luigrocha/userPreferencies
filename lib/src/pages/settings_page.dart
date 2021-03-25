import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Pedro';

  TextEditingController _textEditingController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textEditingController = new TextEditingController(text: prefs.usuario);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: Center(
            child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;

                  setState(() {});
                }),
            RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              title: Text('Femenino'),
              value: 2,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona que usa el teléfono',
                ),
                onChanged: (value) {
                  prefs.usuario = value;
                },
              ),
            )
          ],
        )));
  }
}
