import 'dart:async';
import 'package:app/core/routers/route_page.dart';
import 'package:flutter/material.dart';

class RouteBloc extends Object {
  List<Function> whantToDoAfterLogin = [];
  static final _intence = RouteBloc._();
  factory RouteBloc() => _intence;
  RouteBloc._();

  final _currentPages = List<RoutePage>.filled(
    1,
    RouteOnboarding(),
    growable: true,
  );

  List<RoutePage> get routePage => _currentPages;

  final _pageController = StreamController<List<Page<dynamic>>>.broadcast();
  dispose() {
    _pageController.close();
  }

  _notify() {
    // if (_currentPages.last.isProtected && _authBloc.token == null) {
    //   _currentPages.add(RouteLogin());
    // }
    _pageController.sink.add(_currentPages.map((e) => e.page).toList());
  }

  bool pop() {
    if (_currentPages.length > 1) {
      _currentPages.removeLast();
      _notify();
      return false;
    }
    return true;
  }

  push(RoutePage page) {
    // if (page.isProtected && _authBloc.token == null) {
    //   whantToDoAfterLogin.add(() {
    //     _currentPages.removeWhere((element) => element.name == page.name);
    //     _currentPages.add(page);
    //     _notify();
    //   });
    //   _currentPages.add(RouteLogin());
    //   _notify();
    //   return;
    // }
    _currentPages.add(page);
    _notify();
  }

  popThenPush(RoutePage page) {
    pop();
    push(page);
  }

  backHome() {
    _currentPages.removeWhere((element) => element is! RouteDashboard);
  }

  Stream<List<Page<dynamic>>> get pages => _pageController.stream;
}
