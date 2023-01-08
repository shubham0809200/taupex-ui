part of 'login_screen_view.dart';

class _LoginScreenMobile extends StatelessWidget {
  final LoginScreenViewModel viewModel;

  const _LoginScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // makr it scrollable

    return Scaffold(
      backgroundColor: const Color(0xFF465FD3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.055),
              Center(
                  child: Text(viewModel.title,
                      style: GoogleFonts.timmana(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: PageView.builder(
                    onPageChanged: (value) => viewModel.changePage(value),
                    itemCount: viewModel.splashData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(
                            viewModel.splashData[index]['image'].toString(),
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            viewModel.splashData[index]['text'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  viewModel.splashData.length,
                  (index) => buildTabs(
                      index: index, currentPage: viewModel.currentPage),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  signupButton(context, 'Facebook', Icons.facebook, () {
                    Navigator.pushReplacementNamed(context, '/pageSelector');
                  }, const Color(0xFF3B4FBC), const Color(0xFFFFFFFF)),
                  signupButton(context, 'Google', Icons.g_mobiledata, () {
                    viewModel.signInWithGoogle().then((value) {
                      if (value) {
                        Navigator.pushReplacementNamed(
                            context, '/pageSelector');
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Something went wrong',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  }, const Color(0xFFDC4A33), const Color(0xFFFFFFFF)),
                  signupButton(context, 'Sign Up', Icons.mail, () {
                    Navigator.pushReplacementNamed(context, '/pageSelector');
                  }, const Color(0xFFFFFFFF), const Color(0xFF465FD3)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Text(
                'By Logging into account you are aggering with our \n Terms & Conditions and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
