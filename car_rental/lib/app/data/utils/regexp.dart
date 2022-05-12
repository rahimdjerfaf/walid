final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");

String? emailValidator(String email) {
  if (email.isEmpty) {
    return 'Email can\'t be empty';
  }
  if (!emailRegExp.hasMatch(email)) {
    return "Invalid email";
  }
  return null;
}

String? passwordValidator(String password) {
  if (password.isEmpty) {
    return 'Password can\'t be empty';
  }
  if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}
