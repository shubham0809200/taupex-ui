part of 'home_screen_view.dart';

class _HomeScreenMobile extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const _HomeScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: StreamBuilder<QuerySnapshot>(
  //       stream: viewModel.getData(),
  //       builder:
  //           (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
  //         if (snapshot.hasError) {
  //           return const Center(child: Text('Something went wrong'));
  //         }
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //         if (snapshot.data!.docs.isEmpty) {
  //           return const Center(
  //             child: Text('No data'),
  //           );
  //         }
  //         return Scaffold(
  //           body: Stack(
  //             children: [
  //               _buildBackgroundBody(context),
  //               _buildBody(context),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundBody(context),
          _buildBody(context),
        ],
      ),
    );
  }

// a half circle from the top of the screen
  _buildBackgroundBody(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.35,
        //3A50B4
        decoration: const BoxDecoration(
          color: Color(0xFF3A50B4),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(150),
          ),
        ),
      ),
      // make a small circle
      Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 68, 91, 207),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(150),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 66, 88, 195),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(150),
          ),
        ),
      ),
      Positioned(
        right: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
            color: Color.fromARGB(137, 42, 68, 184),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(150),
            ),
          ),
        ),
      ),
    ]);
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Ready to Pay Bills?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 10.0),
                child: Column(
                  children: [
                    const Text(
                      "You have 12 unpaid bills this month",
                      style: TextStyle(color: Colors.grey),
                    ),
                    // make a long circular button with a text in center
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.45,
                      // 4B66E5
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF4B66E5),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Pay all bills at once",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _toggleSwitch(context),
                    const SizedBox(height: 10),
                    _overdueContainer(context),
                    const SizedBox(height: 15),
                    _upcommingContainer(context),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container _toggleSwitch(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.9,
      // 7A8BD6
      decoration: BoxDecoration(
        color: const Color(0xFF7A8BD6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //  a icona nd then text
          InkWell(
            onTap: () => viewModel.onUpcomming(),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.38,
              decoration: BoxDecoration(
                color: viewModel.upcomming
                    ? Colors.white
                    : const Color(0xFF7A8BD6),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.calendar_month, color: Color(0xFF465FD3)),
                  SizedBox(width: 5),
                  Text(
                    "Upcoming (12)",
                    style: TextStyle(
                        color: Color(0xFF465FD3), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              viewModel.onLaterThisMonth();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: viewModel.laterThisMonth
                    ? Colors.white
                    : const Color(0xFF7A8BD6),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.access_time_outlined, color: Color(0xFF465FD3)),
                  SizedBox(width: 5),
                  Text(
                    "Later this month (6)",
                    style: TextStyle(
                        color: Color(0xFF465FD3), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overdueContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      // height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Overdue",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentData.length,
            itemBuilder: (context, index) {
              // convert string to datetime
              var date = DateTime.parse(paymentData[index].dueDate);
              if (viewModel.calculateDays(date) < 0) {
                return _dueItem(
                  context,
                  paymentData[index],
                  date,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _upcommingContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 15.0, right: 10.0, top: 10.0, bottom: 10.0),
      // height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Due This Week",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentData.length,
            itemBuilder: (context, index) {
              // convert string to datetime
              var date = DateTime.parse(paymentData[index].dueDate);
              if (viewModel.calculateDays(date) > 0 &&
                  viewModel.calculateDays(date) < 7) {
                return _dueItem(
                  context,
                  paymentData[index],
                  date,
                );
              }
              return Container();
            },
          ),
          // ListView(
          //   padding: const EdgeInsets.only(top: 10),
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   children: [
          //     //send a date of 5th Jan
          //     _dueItem(context, "Electricity", DateTime(2023, 2, 5), "50"),
          //     _dueItem(context, "Electricity", DateTime(2023, 5, 3), "90"),
          //     _dueItem(context, "Electricity", DateTime(2023, 5, 3), "90"),
          //     _dueItem(context, "Electricity", DateTime(2023, 5, 3), "90"),
          //     _dueItem(context, "Electricity", DateTime(2023, 5, 3), "90"),
          //     _dueItem(context, "Electricity", DateTime(2023, 5, 3), "90"),
          //     _dueItem(context, "Electricity", DateTime(2023, 5, 3), "90"),
          //   ],
          // ),
        ],
      ),
    );
  }

  _dueItem(BuildContext context, PaymentModel paymentData, DateTime date) {
    const String dateFormate = "dd MMM";
    final String dateText = "Due ${DateFormat(dateFormate).format(date)}";

    return Dismissible(
      key: Key(paymentData.id),
      background: Container(
        color: const Color(0xFF7ED321),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "Pay Now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await _makeADialog(context, paymentData);
        } else {
          return false;
        }
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 5.0, right: 5.0),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          paymentData.category == 'Food'
                              ? Icons.fastfood
                              : paymentData.category == 'Shopping'
                                  ? Icons.shopping_cart
                                  : paymentData.category == 'Travel'
                                      ? Icons.flight
                                      : Icons.home,
                          color: Colors.black,
                          size: 20,
                        )),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentData.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              dateText,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // show due date
                            viewModel.calculateDays(date) > 0
                                ? Text(
                                    "${viewModel.calculateDays(date)} days to pay",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Text(
                                    "${viewModel.calculateDays(date)} days to pay",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 240, 163, 165),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      paymentData.amount,
                      style: TextStyle(
                        fontSize: 16,
                        color: viewModel.calculateDays(date) > 0
                            ? Colors.black
                            : const Color.fromARGB(255, 240, 163, 165),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // show rupees icon
                    Icon(
                      Icons.euro_symbol,
                      color: viewModel.calculateDays(date) > 0
                          ? Colors.black
                          : const Color.fromARGB(255, 240, 163, 165),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.circle_outlined,
                      size: 20,
                    ),
                  ],
                ),
                // dashLine(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container dashLine(BuildContext context) {
    return Container(
      height: 1,
      // width: MediaQuery.of(context).size.width * 0.5,
      color: Colors.grey,
    );
  }

  _makeADialog(BuildContext context, PaymentModel paymentData) {
    return showDialog(
      context: context,
      builder: (context) {
        // make a gryish color overlay on whole screen
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          // make a cross button at the top right cornor of the screen at position top-10 and right-10
          child: Stack(
            children: [
              // make a cross button
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // cross inside a circle
                  child: Container(
                    height: 30,
                    width: 30,
                    //969696
                    decoration: BoxDecoration(
                      color: const Color(0xFF969696),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                      child: Icon(
                                    paymentData.category == 'Food'
                                        ? Icons.fastfood
                                        : paymentData.category == 'Shopping'
                                            ? Icons.shopping_cart
                                            : paymentData.category == 'Travel'
                                                ? Icons.flight
                                                : Icons.home,
                                    color: const Color(0xFF465FD3),
                                    size: 25,
                                  )),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  paymentData.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.circle_outlined,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        blocks(paymentData.issuedDate, "Issued Date"),
                        const SizedBox(height: 15),
                        dashLine(context),
                        const SizedBox(height: 15),
                        blocks(paymentData.dueDate, "Payment Date"),
                        const SizedBox(height: 15),
                        dashLine(context),
                        const SizedBox(height: 15),
                        blocks(
                            'Swedbank, AS Kods HABA LV22 \n LV21HAB0055561546231',
                            "Beneficiary"),
                        const SizedBox(height: 15),
                        dashLine(context),
                        const SizedBox(height: 15),
                        blocks(paymentData.description, "Description"),
                        const SizedBox(height: 15),
                        dashLine(context),
                        const SizedBox(height: 15),
                        blocks(paymentData.amount, "Total Amount"),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: "Added to Pay-list",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  // color: const Color(0xFF969696),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: const Color(0xFF465FD3),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Add to Paylist",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF465FD3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: "Payment Successful",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF465FD3),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Pay Now",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget blocks(String data, String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
