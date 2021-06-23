import 'dart:async';
import 'package:flutter/widgets.dart';

abstract class BaseProvider extends ChangeNotifier {

  StreamController<Map<String, String>> _messageController = StreamController<Map<String, String>>.broadcast();
  Stream get messageStream => _messageController.stream;

  bool _showLoader = false, _emptyState = true;

  setTitleAndMessage(final String title, final String message) {
    _messageController.add({title : message});
  }

  bool get showLoader {
    return this._showLoader;
  }

  set showLoader(value) {
    this._showLoader = value;
    notifyListeners();
  }

  bool get emptyState {
    return this._emptyState;
  }

  set emptyState(value) {
    this._emptyState = value;
    notifyListeners();
  }

  disposeStream(){
    _messageController.close();
  }

}
