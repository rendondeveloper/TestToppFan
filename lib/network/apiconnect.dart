import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:test_toppfan/base/baseapi.dart';
import 'package:test_toppfan/base/response.dart';

class ApiConnect extends BaseApi {
  Future<ResponseBase> executeCall(url) async {
    final urlApi = Uri.https(super.urlBase, url);

    ResponseBase responseData = await super.connectionInternetAvailable();

    if (!responseData.isSuccess) {
      return responseData;
    }

    await http.get(urlApi).then((response) {
      responseData.isSuccess = response.statusCode == 200;

      if (responseData.isSuccess) {
        responseData.mapValueJson = convert.jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        responseData.loadData(message: "Ocurrio un error al intentar conectar con nuetsros sevridores, intentalo nuevamente");
      }
    }).timeout(Duration(minutes: super.timeOutMinutes), onTimeout: () {
      responseData.loadData(isSuccess: false, message: "El tiempo para la solictud fue muy largo, intentalo nuevamente");
    }).catchError((onError, stack) {
      responseData.loadData(isSuccess: false, message: "Ocurrio un error al intentar conectar con nuetsros sevridores, intentalo nuevamente");
    });

    return responseData;
  }
}

