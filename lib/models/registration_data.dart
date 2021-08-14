part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  File profilImage;

  RegistrationData(
      {this.name = "", this.email = "", this.password = "", this.profilImage});
}
