// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hostel_app/ui/auth/login_screen.dart';
import 'package:hostel_app/ui/dashboard/widgets/sample_line_chart.dart';
import 'package:hostel_app/ui/in_out_log/in_out_log_screen.dart';
import 'package:hostel_app/ui/payment/payment_screen.dart';

import 'widgets/built_dashboard_button.dart';
import 'widgets/sample_pie_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.black, width: 2),
          //     shape: BoxShape.circle,
          //   ),
          //   child: ClipOval(
          //     child: Image.network(
          //       'https://hrms.waltonbd.com/${responseData['photo']}', // responseData['photo'],
          //       fit: BoxFit.cover,
          //       width: 32,
          //       height: 32,
          //     ),
          //   ),
          // ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirm Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Logout'),
                      onPressed: () {
                        // Add your logout logic here
                        // print('Logout clicked');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                              title: 'Login',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
        elevation: 8,
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Card(child: LineChartSample()),
                      Card(child: PieChartSample()),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DashboardButton(
                            width: constraints.maxWidth / 3 - 10,
                            buttonName: 'Payment',
                            buttonColor: Color(0xff5a9bff),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(),
                                ),
                              );
                            },
                          ),
                          DashboardButton(
                            width: constraints.maxWidth / 3 - 10,
                            buttonName: 'In Out Log',
                            buttonColor: Color(0xffF8B859),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InOutLogScreen(),
                                ),
                              );
                            },
                          ),
                          DashboardButton(
                            width: constraints.maxWidth / 3 - 10,
                            buttonName: 'Transaction History',
                            buttonColor: Color(0xff25E371),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
