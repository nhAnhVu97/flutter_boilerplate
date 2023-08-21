import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_boilerplate/core/shared/utils/app_logger.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    AppLogger.w('onCreated: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // AppLogger.w('onChange: [${bloc.runtimeType}] - ${change.currentState} -> ${change.nextState}');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.e('onError: [${bloc.runtimeType}] - $error', stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    AppLogger.w('onClosed: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
