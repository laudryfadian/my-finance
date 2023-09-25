// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashflowScreen extends StatefulWidget {
  const CashflowScreen({Key? key}) : super(key: key);

  @override
  State<CashflowScreen> createState() => _CashflowScreenState();
}

class _CashflowScreenState extends State<CashflowScreen> {
  String outArrow = "https://cdn-icons-png.flaticon.com/512/4440/4440649.png";
  String inArrow = "https://cdn-icons-png.flaticon.com/512/1006/1006646.png";

  @override
  Widget build(BuildContext context) {
    List categories = [
      {
        "type": "in",
        "nominal": 2000000,
        "desc": "buat makan",
        "date": "21-01-2021"
      },
      {
        "type": "in",
        "nominal": 100000,
        "desc": "buat makan",
        "date": "21-01-2021"
      },
      {
        "type": "out",
        "nominal": 20000,
        "desc": "buat makan",
        "date": "21-01-2021"
      },
      {
        "type": "in",
        "nominal": 50000,
        "desc": "buat makan",
        "date": "21-01-2021"
      },
      {
        "type": "in",
        "nominal": 60000,
        "desc": "buat makanssssssssss ssss",
        "date": "21-01-2021"
      },
      {
        "type": "out",
        "nominal": 20000,
        "desc": "buat makan",
        "date": "21-01-2021"
      },
      {
        "type": "out",
        "nominal": 20000,
        "desc": "buat makan",
        "date": "21-01-2021"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F9),
      appBar: AppBar(
        title: const Text("Cash Flow"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = categories[index];
            String formattedNominal = NumberFormat.currency(
              locale: 'id_ID', // Sesuaikan dengan preferensi Anda
              symbol: 'Rp ',
              decimalDigits: 0,
            ).format(item['nominal']);

            return Container(
              height: 100.0,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(top: 7, bottom: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                // image: DecorationImage(
                //   image: NetworkImage(
                //     "https://static.vecteezy.com/system/resources/previews/011/319/806/non_2x/abstract-gradient-mesh-background-pastel-colors-and-blur-pink-purple-blue-grey-color-gradient-background-vector.jpg",
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedNominal,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(item['desc']),
                          Text(item['date']),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.network(
                      item['type'] == "in" ? inArrow : outArrow,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
