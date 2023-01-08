part of 'splash_screen_view.dart';

class _SplashScreenMobile extends StatelessWidget {
  final SplashScreenViewModel viewModel;

  const _SplashScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(viewModel.title),
            // child: Image(
            //   image: AssetImage('assets/images/logo.png'),
            //   height: 200,
            //   width: 300,
            // ),
          ),
        ],
      ),
    );
  }
}
