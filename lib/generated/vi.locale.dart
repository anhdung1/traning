class LocaleStringsVi {
  Auth get auth => Auth();
}

class SignIn {
  String get signIn => "Đăng nhập";
  String get mainTitle => "Chào mừng trở lại";
  String get subTitle => "Xin chào, đăng nhập để tiếp tục";
  String get forgotPassword => "Quên mật khẩu?";
  String get noAccountQuestion => "Bạn không có tài khoản?";
}


class SignUp {
  String get signUp => "Đăng kí";
  String get mainTitle => "Chào mừng đến với chúng tôi";
  String get subTitle => "Xin chào, hãy tạo một tài khoản mới";
  String get termAndConditions => "Bằng cách tạo tài khoản, bạn đồng ý với các {term_and_conditions}.";
  String get alreadyHaveAccount => "Bạn đã có tài khoản?";
}


class Auth {
  SignIn get signIn => SignIn();
  SignUp get signUp => SignUp();
}

