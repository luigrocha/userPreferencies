import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  // ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //get y set

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String value) {
    _prefs.setString('usuario', value);
  }
}
