// ignore_for_file: constant_identifier_names, unnecessary_string_interpolations

// const String url = String.fromEnvironment("BASE_URL");
// const String url = "https://genzeh911.softvencefsd.xyz";
const String url = "https://byemicroplastics.xyz";
// ignore: unnecessary_brace_in_string_interps
const String imageUrl = "${url}";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

// final class PaymentGateway {
//   PaymentGateway._();
//   static String gateway(String orderId) =>  "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
// }

final class Endpoints {
  Endpoints._();
  //onboard
  static String onboard() => "/api/onboard";
  static String signup() => "/api/register";
  static String login() => "/api/login";
  static String logout() => "/api/logout";
  static String otpSend() => "/api/request-reset";
  static String otpVerify() => "/api/matchOtp";

  //educational Insight
  static String insights() => "/api/education_insights";
  static String insightDetails(int id) => "/api/education_insights/$id";

  //profile
  static String profile() => "/api/user";
  static String editprofile() => "/api/profile";

  //scanResult
    static String scan() => "/api/product-scan?image";


}
