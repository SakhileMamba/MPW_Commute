import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show DynamicLinksHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  CommuteFirebaseUser? initialUser;
  CommuteFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(CommuteFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.loggedIn
          ? NavBarPage()
          : PhoneAuthenticationPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavBarPage()
              : PhoneAuthenticationPageWidget(),
          routes: [
            FFRoute(
              name: 'phone_authentication_page',
              path: 'phoneAuthenticationPage',
              builder: (context, params) => PhoneAuthenticationPageWidget(),
            ),
            FFRoute(
              name: 'phone_confirmation_page',
              path: 'phoneConfirmationPage',
              builder: (context, params) => PhoneConfirmationPageWidget(),
            ),
            FFRoute(
              name: 'browse_drivers_page',
              path: 'browseDriversPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'browse_drivers_page')
                  : BrowseDriversPageWidget(),
            ),
            FFRoute(
              name: 'browse_passengers_page',
              path: 'browsePassengersPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'browse_passengers_page')
                  : BrowsePassengersPageWidget(),
            ),
            FFRoute(
              name: 'manage_commutes_driver_page',
              path: 'manageCommutesDriverPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'manage_commutes_driver_page')
                  : ManageCommutesDriverPageWidget(),
            ),
            FFRoute(
              name: 'manage_commutes_passenger_page',
              path: 'manageCommutesPassengerPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'manage_commutes_passenger_page')
                  : ManageCommutesPassengerPageWidget(),
            ),
            FFRoute(
              name: 'account_page',
              path: 'accountPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'account_page')
                  : AccountPageWidget(),
            ),
            FFRoute(
              name: 'browse_drivers_details_page',
              path: 'browseDriversDetailsPage',
              requireAuth: true,
              asyncParams: {
                'commuteDoc': getDoc('commutes', CommutesRecord.serializer),
                'driverDoc': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => BrowseDriversDetailsPageWidget(
                commuteDoc: params.getParam('commuteDoc', ParamType.Document),
                driverDoc: params.getParam('driverDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'delete_commutes_management_details_page',
              path: 'deleteCommutesManagementDetailsPage',
              requireAuth: true,
              builder: (context, params) =>
                  DeleteCommutesManagementDetailsPageWidget(
                commuteRef: params.getParam('commuteRef',
                    ParamType.DocumentReference, false, 'commutes'),
              ),
            ),
            FFRoute(
              name: 'government_id_update_Page',
              path: 'governmentIdUpdatePage',
              requireAuth: true,
              builder: (context, params) => GovernmentIdUpdatePageWidget(),
            ),
            FFRoute(
              name: 'personal_information_update_page',
              path: 'personalInformationUpdatePage',
              requireAuth: true,
              builder: (context, params) =>
                  PersonalInformationUpdatePageWidget(),
            ),
            FFRoute(
              name: 'list_vehicles_page',
              path: 'listVehiclesPage',
              requireAuth: true,
              builder: (context, params) => ListVehiclesPageWidget(),
            ),
            FFRoute(
              name: 'filter_commutes_page',
              path: 'filterCommutesPage',
              requireAuth: true,
              builder: (context, params) => FilterCommutesPageWidget(),
            ),
            FFRoute(
              name: 'create_commute_page',
              path: 'createCommutePage',
              requireAuth: true,
              builder: (context, params) => CreateCommutePageWidget(),
            ),
            FFRoute(
              name: 'add_vehicle_page',
              path: 'addVehiclePage',
              requireAuth: true,
              builder: (context, params) => AddVehiclePageWidget(),
            ),
            FFRoute(
              name: 'subscriptions_page',
              path: 'subscriptionsPage',
              requireAuth: true,
              builder: (context, params) => SubscriptionsPageWidget(),
            ),
            FFRoute(
              name: 'profile_picture_update_Page',
              path: 'profilePictureUpdatePage',
              requireAuth: true,
              builder: (context, params) => ProfilePictureUpdatePageWidget(),
            ),
            FFRoute(
              name: 'drivers_license_update_page',
              path: 'driversLicenseUpdatePage',
              requireAuth: true,
              builder: (context, params) => DriversLicenseUpdatePageWidget(),
            ),
            FFRoute(
              name: 'approve_drivers_page',
              path: 'approveDriversPage',
              requireAuth: true,
              builder: (context, params) => ApproveDriversPageWidget(),
            ),
            FFRoute(
              name: 'approve_users_page',
              path: 'approveUsersPage',
              requireAuth: true,
              builder: (context, params) => ApproveUsersPageWidget(),
            ),
            FFRoute(
              name: 'update_user_first_name',
              path: 'updateUserFirstName',
              requireAuth: true,
              builder: (context, params) => UpdateUserFirstNameWidget(),
            ),
            FFRoute(
              name: 'update_user_surname',
              path: 'updateUserSurname',
              requireAuth: true,
              builder: (context, params) => UpdateUserSurnameWidget(),
            ),
            FFRoute(
              name: 'success_lottie',
              path: 'successLottie',
              requireAuth: true,
              builder: (context, params) => SuccessLottieWidget(),
            ),
            FFRoute(
              name: 'propose_passenger_pickup_page',
              path: 'proposePassengerPickupPage',
              requireAuth: true,
              asyncParams: {
                'passengerHail': getDoc(
                    'passengers_hailing', PassengersHailingRecord.serializer),
              },
              builder: (context, params) => ProposePassengerPickupPageWidget(
                passengerHail:
                    params.getParam('passengerHail', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'create_passenger_seat_hail_page',
              path: 'createPassengerSeatHailPage',
              requireAuth: true,
              builder: (context, params) => CreatePassengerSeatHailPageWidget(),
            ),
            FFRoute(
              name: 'browse_passengers_details_page',
              path: 'browsePassengersDetailsPage',
              requireAuth: true,
              asyncParams: {
                'hailingDoc': getDoc(
                    'passengers_hailing', PassengersHailingRecord.serializer),
                'passenger': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => BrowsePassengersDetailsPageWidget(
                hailingDoc: params.getParam('hailingDoc', ParamType.Document),
                passenger: params.getParam('passenger', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'delete_accept_drivers_details_page',
              path: 'deleteAcceptDriversDetailsPage',
              requireAuth: true,
              asyncParams: {
                'hailDoc': getDoc(
                    'passengers_hailing', PassengersHailingRecord.serializer),
              },
              builder: (context, params) =>
                  DeleteAcceptDriversDetailsPageWidget(
                hailDoc: params.getParam('hailDoc', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/phoneAuthenticationPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  child: Image.asset(
                    'assets/images/Commute_2160px_logo.png',
                    fit: BoxFit.scaleDown,
                  ),
                )
              : PushNotificationsHandler(
                  child: DynamicLinksHandler(child: page));

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
