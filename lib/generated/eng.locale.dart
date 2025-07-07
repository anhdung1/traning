class LocaleStringsEng {
  Auth get auth => Auth();
}

class SignIn {
  String get signIn => "Sign In";
  String get mainTitle => "Welcome Back";
  String get subTitle => "Hello, please sign in to continue";
  String get forgotPassword => "Forgot password?";
  String get noAccountQuestion => "Don't have an account?";
}


class SignUp {
  String get signUp => "Sign Up";
  String get mainTitle => "Welcome to Us";
  String get subTitle => "Hello, please create a new account";
  String get termAndConditions => "By creating an account, you agree to the {term_and_conditions}.";
  String get alreadyHaveAccount => "Already have an account?";
}


class Auth {
  SignIn get signIn => SignIn();
  SignUp get signUp => SignUp();
}

