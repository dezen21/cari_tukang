part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    auth.User firebaseUser = Provider.of<auth.User>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnAccountConfirmationPage)
                        ? AccountConfirmationPage(pageState.registrationData)
                        : (pageState is OnProfilePage)
                            ? ProfilePage()
                            : (pageState is OnInteriorDetailPage)
                                ? InteriorDetail()
                                : (pageState is OnKitchensetDetailPage)
                                    ? KitchensetDetail()
                                    : (pageState is OnEditProfilePage)
                                        ? EditProfilePage(pageState.user)
                                        : MainPage());
  }
}
