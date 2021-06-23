import 'dart:async';
import 'package:test_toppfan/network/ApiConnect.dart';
import 'package:test_toppfan/ui/model/responsestadium.dart';
import 'package:test_toppfan/ui/model/stadiummodel.dart';

class Repository {
  final String url = "/api/rows";
  final apiConnect = ApiConnect();

  Future<ResponseStadium> getInfoStadium() async {
    ResponseStadium responseStadium = ResponseStadium(null);

    await apiConnect.executeCall(url).then((response) {
      if (response.isSuccess) {
        responseStadium.isSuccess = true;
        responseStadium.stadiumModel =
            StadiumModel.fromJson(response.mapValueJson);
      } else {
        responseStadium = response;
      }
    }).catchError((onError, stack) {
      responseStadium.isSuccess = false;
      responseStadium.message = onError.message;
    });
    return responseStadium;
  }

}
