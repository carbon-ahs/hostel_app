import 'package:flutter/material.dart';
import 'package:hostel_app/ui/auth/widgets/build_app_bar.dart';

import 'widgets/build_body.dart';

enum DateFilter { today, last3Days, last7Days, last30Days }

class InOutLogScreen extends StatefulWidget {
  const InOutLogScreen({super.key});

  @override
  State<InOutLogScreen> createState() => _InOutLogScreenState();
}

class _InOutLogScreenState extends State<InOutLogScreen> {
  Set<DateFilter> filters = <DateFilter>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "In Out Log"),
      body: buildBody(),
    );
  }
}
