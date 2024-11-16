// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hostel_app/ui/in_out_log/widgets/build_toggle_text_buttons.dart';
import 'package:hostel_app/ui/in_out_log/widgets/built_datatable.dart';
import 'package:provider/provider.dart';

Widget buildBody() {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _InOutLogToggleButtons(),
          _InOutLogDataTable(),
        ],
      ),
    ),
  );
}

class _InOutLogToggleButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildToggleTextButtons(
      texts: [
        Text('This Week'),
        Text('Last 2 Weeks'),
        Text('Last 4 Weeks'),
        Text('All'),
      ],
      multipleSelectionsAllowed: false,
      selectedColor: Colors.pinkAccent,
      selected: (index) {},
    );
  }
}

class _InOutLogDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildDatatable(),
    );
  }
}
