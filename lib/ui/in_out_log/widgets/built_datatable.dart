import 'package:flutter/material.dart';

Widget buildDatatable() {
  return DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Expanded(
          child: Text(
            'Date',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Out Time',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'In Time',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    ],
    rows: const <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('01-01-2025')),
          DataCell(Text('04:03:06 PM')),
          DataCell(Text('06:15:32 PM')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('02-01-2025')),
          DataCell(Text('04:01:23 PM')),
          DataCell(Text('06:30:11 PM')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('03-01-2025')),
          DataCell(Text('04:07:06 PM')),
          DataCell(Text(' --- ')),
        ],
      ),
    ],
  );
}
