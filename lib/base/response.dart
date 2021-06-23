class ResponseBase{
  String message;
  bool isSuccess;
  String codeError;
  Map<String, dynamic> mapValueJson;

  ResponseBase({this.isSuccess, this.message, this.codeError, this.mapValueJson});

  loadData({final bool isSuccess,
    final String message,
    final String codeError = ""
  })
  async {
    this.message = message;
    this.isSuccess = isSuccess;
    this.codeError = codeError;
  }
}