part of 'page_selector_view.dart';

class _PageSelectorMobile extends StatelessWidget {
  final PageSelectorViewModel viewModel;

  const _PageSelectorMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewModel.pages[viewModel.pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pageSelector(
                  Icons.list_alt, () => viewModel.setPageIndex(0), 0, 'Home'),
              pageSelector(
                  Icons.history, () => viewModel.setPageIndex(1), 1, 'History'),
              centerPage(context),
              pageSelector(Icons.credit_card, () => viewModel.setPageIndex(2),
                  2, 'Card'),
              pageSelector(
                  Icons.person, () => viewModel.setPageIndex(3), 3, 'Profile'),
            ],
          )),
    );
  }

  Widget pageSelector(
      IconData iconActive, Function() function, int index, String title) {
    return Column(
      children: [
        IconButton(
            enableFeedback: false,
            onPressed: () {
              function();
            },
            icon: Icon(
              iconActive,
              color: viewModel.pageIndex == index
                  ? const Color(0xFF465FD3)
                  : Colors.grey,
              size: 30,
            )),
        const SizedBox(
          height: 5,
        ),
        Text(title,
            style: TextStyle(
                color: viewModel.pageIndex == index
                    ? const Color(0xFF465FD3)
                    : Colors.grey,
                fontSize: 12,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

// an icon inside a circle
  Widget centerPage(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF465FD3),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: IconButton(
          enableFeedback: false,
          onPressed: () {
            viewModel.setPageIndex(0);
          },
          icon: const Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
            size: 35,
          )),
    );
  }
}
