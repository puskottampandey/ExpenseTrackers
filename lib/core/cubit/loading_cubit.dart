import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);
  bool _isLoading = false;
  loadingEnable() {
    _isLoading = true;
    emit(_isLoading);
  }

  loadingDisable() {
    _isLoading = false;
    emit(_isLoading);
  }
}
