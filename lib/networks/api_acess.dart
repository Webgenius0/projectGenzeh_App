import 'package:genzeh911/features/auth/data/rx_login/rx.dart';
import 'package:genzeh911/features/auth/data/rx_logout/rx.dart';
import 'package:genzeh911/features/auth/data/rx_onboard/rx.dart';
import 'package:genzeh911/features/auth/data/rx_signup/rx.dart';
import 'package:genzeh911/features/auth/model/login_model.dart';
import 'package:genzeh911/features/auth/model/onboard_model.dart';
import 'package:genzeh911/features/auth/model/signup_model.dart';
import 'package:rxdart/rxdart.dart';

OnboardRx onboardRx = OnboardRx(
    empty: OnboardModel(), dataFetcher: BehaviorSubject<OnboardModel>());

SignupRx signupRx =
    SignupRx(empty: SignupModel(), dataFetcher: BehaviorSubject<SignupModel>());

LoginRx loginRx =
    LoginRx(empty: LoginModel(), dataFetcher: BehaviorSubject<LoginModel>());

GetLogoutResponseRX getLogoutResponseRX =
    GetLogoutResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
