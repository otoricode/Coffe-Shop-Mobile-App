import 'dart:async';

import 'package:flutter/services.dart';

abstract class Bloc {
  void dispose();
}

class BlocVoucher extends Bloc {
  //Event Channel creation
  static const stream = EventChannel('apps.econsultation.co.id/events');

  //Method channel creation
  static const platform = MethodChannel('apps.econsultation.co.id/channel');

  final StreamController<String> _stateController = StreamController();

  Stream<String> get stateStream => _stateController.stream;

  Sink<String?> get stateSink => _stateController.sink;

  //Adding the listener into contructor
  BlocVoucher() {
    //Checking application start by deep link
    startUri().then(_onRedirected);
    //Checking broadcast stream, if deep link was clicked in opened appication
    stream.receiveBroadcastStream().listen((d) => _onRedirected(d));
  }

  _onRedirected(String? uri) {
    // print("url ==========================> $uri");
    // Here can be any uri analysis, checking tokens etc, if it’s necessary
    // Throw deep link URI into the BloC's stream
    stateSink.add(uri);
  }

  @override
  void dispose() {
    _stateController.close();
  }

  Future<String?> startUri() async {
    try {
      // return platform.invokeMethod('initialLink');
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }
}
