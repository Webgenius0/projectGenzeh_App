import 'package:genzeh911/features/account_and_setting/data/rx_edit_profile/rx.dart';
import 'package:genzeh911/features/account_and_setting/data/rx_profile/rx.dart';
import 'package:genzeh911/features/account_and_setting/model/profile_model.dart';
import 'package:genzeh911/features/auth/data/rx_login/rx.dart';
import 'package:genzeh911/features/auth/data/rx_logout/rx.dart';
import 'package:genzeh911/features/auth/data/rx_onboard/rx.dart';
import 'package:genzeh911/features/auth/data/rx_signup/rx.dart';
import 'package:genzeh911/features/auth/data/rx_send_otp/rx.dart';
import 'package:genzeh911/features/auth/data/rx_verify_otp/rx.dart';
import 'package:genzeh911/features/auth/model/login_model.dart';
import 'package:genzeh911/features/auth/model/onboard_model.dart';
import 'package:genzeh911/features/auth/model/signup_model.dart';
import 'package:genzeh911/features/auth/sign_up/data/rx_verify_otp/rx.dart';
import 'package:genzeh911/features/home/data/rx_educational_insight/rx.dart';
import 'package:genzeh911/features/home/data/rx_educational_insight_details/rx.dart';
import 'package:genzeh911/features/home/data/rx_get_scan_data/rx.dart';
import 'package:genzeh911/features/home/data/rx_get_scan_details.dart/rx.dart';
import 'package:genzeh911/features/home/model/history_details_model.dart';
import 'package:genzeh911/features/home/model/insight_model.dart';
import 'package:genzeh911/features/home/model/scan_model.dart';
import 'package:genzeh911/features/home/model/single_insight_model.dart';
import 'package:genzeh911/features/quick_scan/data/rx_scan_history/rx.dart';
import 'package:genzeh911/features/quick_scan/data/rx_scan_result/rx.dart';
import 'package:genzeh911/features/quick_scan/model/scan_history_model.dart';
import 'package:genzeh911/features/quick_scan/model/scan_result_model.dart';
import 'package:rxdart/rxdart.dart';

OnboardRx onboardRx = OnboardRx(
    empty: OnboardModel(), dataFetcher: BehaviorSubject<OnboardModel>());

SignupRx signupRx =
    SignupRx(empty: SignupModel(), dataFetcher: BehaviorSubject<SignupModel>());

LoginRx loginRx =
    LoginRx(empty: LoginModel(), dataFetcher: BehaviorSubject<LoginModel>());

GetLogoutResponseRX getLogoutResponseRX =
    GetLogoutResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

OtpSendRx otpSendRx = OtpSendRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

OtpVerifyRx otpVerifyRx =
    OtpVerifyRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

InsightRx insightRx = InsightRx(
    empty: InsightModel(), dataFetcher: BehaviorSubject<InsightModel>());

InsightDetailsRx insightDetailsRx = InsightDetailsRx(
    empty: SingleInsightModel(),
    dataFetcher: BehaviorSubject<SingleInsightModel>());

GetProfileRx profileRx = GetProfileRx(
    empty: ProfileModel(), dataFetcher: BehaviorSubject<ProfileModel>());

GetEditProfileResponseRX getEditProfileResponseRX =
    GetEditProfileResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

ScanResultRx scanResultRx = ScanResultRx(
    empty: ScanResultModel(), dataFetcher: BehaviorSubject<ScanResultModel>());

ScanHistoryRx scanHistoryRx = ScanHistoryRx(
    empty: ScanHistoryModel(),
    dataFetcher: BehaviorSubject<ScanHistoryModel>());

ScanDataRx scanDataRx =
    ScanDataRx(empty: ScanModel(), dataFetcher: BehaviorSubject<ScanModel>());

ScanDatDetailsaRx scanDatDetailsaRx = ScanDatDetailsaRx(
    empty: HistoryDetailsModel(),
    dataFetcher: BehaviorSubject<HistoryDetailsModel>());

RatingRx ratingRx = RatingRx(empty: Map, dataFetcher: BehaviorSubject<Map>());
