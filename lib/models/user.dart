part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final int balance;

  User(this.id, this.email, {this.profilePicture, this.balance, this.name});

  User copyWith({String name, String profilePicture, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance);
  @override
  String toString() {
    return "[$id - $name, $email";
  }

  @override
  List<Object> get props => [id, email, name, profilePicture, balance];
}
