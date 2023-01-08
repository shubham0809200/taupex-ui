part of 'history_screen_view.dart';

class _HistoryScreenMobile extends StatelessWidget {
  final HistoryScreenViewModel viewModel;

  const _HistoryScreenMobile({Key? key, required this.viewModel})
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
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            'How much I spend',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              // height: MediaQuery.of(context).size.height * 0.70,
              color: Colors.white,
              child: buildBox(context),
            )
          ]),
        ),
      ],
    );
  }

  buildBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'How much I spend',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _dropDown(context),
            ],
          ),
          const SizedBox(height: 20),
          _buildChart(context),
          const SizedBox(height: 20),
          _buildList(context),
        ],
      ),
    );
  }

  _dropDown(BuildContext context) {
    // make a dropdown for months with circular border
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 0.5,
        ),
      ),
      child: DropdownButton<String>(
        hint: const Text('Month',
            style: TextStyle(color: Color.fromARGB(255, 80, 112, 253))),
        value: viewModel.selectedMonth,
        icon: const Icon(Icons.keyboard_arrow_down_sharp,
            color: Color.fromARGB(255, 80, 112, 253)),
        iconSize: 24,
        elevation: 10,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          viewModel.changeMonth(newValue!);
        },
        items: months.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style:
                    const TextStyle(color: Color.fromARGB(255, 80, 112, 253))),
          );
        }).toList(),
      ),
    );
  }

  _buildChart(BuildContext context) {
    // make a graph depending on the month spent
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.80,
      child: SfCartesianChart(
        margin: const EdgeInsets.all(0),
        borderWidth: 0,
        primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          minimum: months.indexOf(viewModel.selectedMonth) - 1,
          maximum: months.indexOf(viewModel.selectedMonth) + 2,
          interval: 5,
          isVisible: true,
          axisLine: const AxisLine(width: 0),
          labelStyle: const TextStyle(color: Colors.black),
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          minimum: 0,
          maximum: 1000,
          interval: 20,
          isVisible: true,
          axisLine: const AxisLine(width: 0),
          labelStyle: const TextStyle(color: Colors.transparent),
        ),
        series: <ChartSeries>[
          ColumnSeries<ChartData, num>(
            dataSource: viewModel.chartData,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            // pointColorMapper: (ChartData data, _) => data.color,
          ),
        ],
      ),
    );
  }

  _buildList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${viewModel.selectedMonth} bills',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paymentData.length,
          itemBuilder: (BuildContext context, int index) {
            var date = DateTime.parse(paymentData[index].dueDate);
            const String dateFormate = "MMM";
            final String dateText = DateFormat(dateFormate).format(date);
            final String selectedMonth =
                viewModel.selectedMonth.substring(0, 3);
            if (dateText != selectedMonth) {
              return Container();
            }
            return _buildListItem(context, paymentData[index].title,
                paymentData[index].amount, paymentData[index].category);
          },
        ),
      ],
    );
  }

  _buildListItem(
      BuildContext context, String title, String amount, String category) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: Center(
                    child: Icon(
                  category == 'Food'
                      ? Icons.fastfood
                      : category == 'Shopping'
                          ? Icons.shopping_cart
                          : category == 'Travel'
                              ? Icons.flight
                              : Icons.home,
                  color: const Color(0xFF465FD3),
                  size: 20,
                )),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.euro_symbol,
              color: Colors.black,
              size: 20,
            ),
          ])
        ],
      ),
    );
  }
}
