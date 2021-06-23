import 'dart:io';
import 'response.dart';

class BaseApi {
  final int timeOutMinutes = 1;
  final String jsonType = 'Content-Type';
  final String jsonConfiguration = 'application/json; charset=UTF-8';
  final String urlBase = 'filloy.com.mx';

  ///Ejecuta la validación del método _getconnection y emite resPuesta a la capa supeior
  Future<ResponseBase> connectionInternetAvailable() async {
    if (await _getConnection()) {
      return ResponseBase(isSuccess: true);
    } else {
      return ResponseBase(
          isSuccess: false,
          message: "No podemos conectar con nuestros servidores, verifica tu conexión a internet.");
    }
  }

  ///Se valida que el dispositivo cuente con una conexón a internet wifi o datos.
  Future<bool> _getConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
