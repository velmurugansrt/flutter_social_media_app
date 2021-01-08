part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSignInEvent extends LoginEvent {
  Map<String, String> payload;
  Map<String, String> userDetails;
  LoginSignInEvent(this.payload, this.userDetails);
}
