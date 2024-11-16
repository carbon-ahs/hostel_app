import 'package:flutter/material.dart';
import 'package:hostel_app/ui/in_out_log/widgets/built_datatable.dart';
import 'package:provider/provider.dart';

Widget buildBody() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'In Out Log',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          
          buildDatatable(),
        ],
      ),
    ),
  );
}
