import 'package:password/password.dart';
void main(){
  print(Password.hash('hello mam', PBKDF2()));
}