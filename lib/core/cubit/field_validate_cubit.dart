import 'package:flutter_bloc/flutter_bloc.dart';

class FieldValidateCubit extends Cubit<bool> {
  FieldValidateCubit() : super(false);
  bool _isAlreadyValidate = false;
  validateField() {
    _isAlreadyValidate = true;
    emit(_isAlreadyValidate);
  }
}
