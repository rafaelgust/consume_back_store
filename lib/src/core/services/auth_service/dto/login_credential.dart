class LoginCredential {
  Email _email = Email('');
  Password _password = Password('');

  Email get email => _email;
  Password get password => _password;

  void setEmail(String email) => _email = Email(email);
  void setPassword(String password) => _password = Password(password);

  String? validate() {
    String? validateEmail = _email.validate();
    String? validatePass = _password.validate();

    if (validateEmail != null) {
      return validateEmail;
    }
    if (validatePass != null) {
      return validatePass;
    }

    return null;
  }
}

class Email {
  final String value;

  Email(this.value);

  String? validate() {
    if (value.isEmpty) {
      return "Campo do email está vazio!";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Email não é válido!";
    }
    return null;
  }
}

class Password {
  final String value;

  Password(this.value);

  String? validate() {
    if (value.isEmpty) {
      return "Campo da senha está vazio!";
    }
    if (value.length < 3) {
      return "Carácteres insuficiente na senha!";
    }
    return null;
  }
}
