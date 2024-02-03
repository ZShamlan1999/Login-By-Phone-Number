import 'package:freezed_annotation/freezed_annotation.dart';
part 'phone_auth_state.freezed.dart';

@freezed
class PhoneAuthState with _$PhoneAuthState {
  const factory PhoneAuthState.initial() = _Initial;
  const factory PhoneAuthState.loading() = Loading;
  const factory PhoneAuthState.submited() = Submited;
  const factory PhoneAuthState.verified() = Verified;
  const factory PhoneAuthState.error({required String error}) = Error;
}
