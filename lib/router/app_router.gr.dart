// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:webspark_test/models/vertex.dart' as _i7;
import 'package:webspark_test/pages/home_screen.dart' as _i1;
import 'package:webspark_test/pages/preview_screen.dart' as _i2;
import 'package:webspark_test/pages/process_screen.dart' as _i3;
import 'package:webspark_test/pages/result_list_screen.dart' as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.PreviewScreen]
class PreviewRoute extends _i5.PageRouteInfo<void> {
  const PreviewRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.PreviewScreen();
    },
  );
}

/// generated route for
/// [_i3.ProcessScreen]
class ProcessRoute extends _i5.PageRouteInfo<ProcessRouteArgs> {
  ProcessRoute({
    _i6.Key? key,
    required List<_i7.VertexDto> vertexes,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ProcessRoute.name,
          args: ProcessRouteArgs(
            key: key,
            vertexes: vertexes,
          ),
          initialChildren: children,
        );

  static const String name = 'ProcessRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProcessRouteArgs>();
      return _i3.ProcessScreen(
        key: args.key,
        vertexes: args.vertexes,
      );
    },
  );
}

class ProcessRouteArgs {
  const ProcessRouteArgs({
    this.key,
    required this.vertexes,
  });

  final _i6.Key? key;

  final List<_i7.VertexDto> vertexes;

  @override
  String toString() {
    return 'ProcessRouteArgs{key: $key, vertexes: $vertexes}';
  }
}

/// generated route for
/// [_i4.ResultListScreen]
class ResultListRoute extends _i5.PageRouteInfo<void> {
  const ResultListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ResultListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ResultListScreen();
    },
  );
}
