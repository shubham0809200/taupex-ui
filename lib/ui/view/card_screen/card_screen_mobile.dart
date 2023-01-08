part of 'card_screen_view.dart';

class _CardScreenMobile extends StatelessWidget {
  final CardScreenViewModel viewModel;

  const _CardScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text("Card Screen"),
          ),
        ],
      ),
    );
  }
}
