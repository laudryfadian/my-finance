// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:my_finance/model/graph.dart';
import 'package:my_finance/screen/cashflow/cashflow.dart';
import 'package:my_finance/screen/home/setting/setting.dart';
import 'package:my_finance/screen/income/income.dart';
import 'package:my_finance/screen/outcome/outcome.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Graph> data = [
      Graph('20-01-2023', 35),
      Graph('21-01-2023', 28),
      Graph('22-01-2023', 34),
      Graph('23-01-2023', 32),
      Graph('24-01-2023', 40)
    ];

    List<Graph> data2 = [
      Graph('20-01-2023', 65),
      Graph('21-01-2023', 58),
      Graph('22-01-2023', 24),
      Graph('23-01-2023', 12),
      Graph('24-01-2023', 10)
    ];

    List<Map> categories = [
      {
        'icon': 'https://cdn-icons-png.flaticon.com/512/6213/6213490.png',
        'title': 'Income',
      },
      {
        'icon': 'https://cdn-icons-png.flaticon.com/512/2720/2720876.png',
        'title': 'Outcome',
      },
      {
        'icon': 'https://cdn-icons-png.flaticon.com/512/10842/10842365.png',
        'title': 'Cash Flow',
      },
      {
        'icon': 'https://cdn-icons-png.flaticon.com/512/4562/4562939.png',
        'title': 'Setting',
      },
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(),
        leadingWidth: 0.0,
        title: SizedBox(
            child: const Text(
          'My-Finance',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        )),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: NetworkImage('https://capekngoding.com/uploads/62f5f123a60ae_15.png'),
                  image: NetworkImage(
                    "https://wallpaperaccess.com/full/1601031.jpg",
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    color: Colors.purple[900]!.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: ListView(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. 232.200.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      'IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      '1.927',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      'OUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      '1.927',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        // Chart title
                        title: ChartTitle(text: 'Summary your balance'),
                        // Enable legend
                        // legend: Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<Graph, String>>[
                          LineSeries<Graph, String>(
                            dataSource: data,
                            xValueMapper: (Graph sales, _) => sales.year,
                            yValueMapper: (Graph sales, _) => sales.sales,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                          ),
                          LineSeries<Graph, String>(
                              dataSource: data2,
                              xValueMapper: (Graph sales, _) => sales.year,
                              yValueMapper: (Graph sales, _) => sales.sales,
                              name: 'Sales',
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: List.generate(
                      categories.length,
                      (index) {
                        var item = categories[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Widget page = Container();
                              switch (item['title']) {
                                case 'Income':
                                  page = IncomeScreen();
                                  break;
                                case 'Outcome':
                                  page = OutcomeScreen();
                                  break;
                                case 'Cash Flow':
                                  page = CashflowScreen();
                                  break;
                                case 'Setting':
                                  page = SettingScreen();
                                  break;
                                default:
                                  break;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => page),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${item['icon']}'))),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    '${item['title']}',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
