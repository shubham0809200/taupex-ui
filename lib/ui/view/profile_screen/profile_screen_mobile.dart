part of 'profile_screen_view.dart';

class _ProfileScreenMobile extends StatelessWidget {
  final ProfileScreenViewModel viewModel;

  const _ProfileScreenMobile({Key? key, required this.viewModel})
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
          ),
          // logout button
          ElevatedButton(
            onPressed: () {
              viewModel
                  .signOut()
                  .then((value) => Navigator.pushReplacementNamed(
                        context,
                        signInScreen,
                      ));
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
