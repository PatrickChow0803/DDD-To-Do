import 'package:auto_route/auto_route_annotations.dart';
import 'package:ddd_to_do/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:ddd_to_do/presentation/sign_in/sign_in_page.dart';
import 'package:ddd_to_do/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: NotesOverviewPage),
    // MaterialRoute(page: NoteFormPage, fullscreenDialog: true),
  ],
)
class $AutoRoute {}
