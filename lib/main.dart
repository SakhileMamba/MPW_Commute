import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'index.dart';
import 'flutter_flow/revenue_cat_util.dart' as revenue_cat;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FFAppState(); // Initialize FFAppState
  await revenue_cat.initialize(
    "testkey",
    "goog_pQSjrugHgHmKpVWWUVZOpkTKwVz",
    false,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<CommuteFirebaseUser> userStream;
  CommuteFirebaseUser? initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((user) {
    revenue_cat.login(user?.uid);
  });
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = commuteFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commute',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).primaryColor,
                child: Image.asset(
                  'assets/images/Commute_2160px_logo.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          : currentUser!.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : PhoneAuthenticationPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'browse_drivers_page';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'browse_drivers_page': BrowseDriversPageWidget(),
      'browse_passengers_page': BrowsePassengersPageWidget(),
      'manage_commutes_driver_page': ManageCommutesDriverPageWidget(),
      'manage_commutes_passenger_page': ManageCommutesPassengerPageWidget(),
      'account_page': AccountPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        selectedItemColor: FlutterFlowTheme.of(context).primaryBtnText,
        unselectedItemColor: FlutterFlowTheme.of(context).primaryBtnText,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.commute_sharp,
              size: 24,
            ),
            label: 'Drivers',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.hail,
              size: 24,
            ),
            label: 'Passengers',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.drive_eta_rounded,
              size: 24,
            ),
            label: 'Commutes',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airline_seat_recline_normal_rounded,
              size: 24,
            ),
            label: 'Seats',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 24,
            ),
            label: 'Account',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
