import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';

class PandaTable extends StatefulWidget {
  final List<PandaTableLabel> pandaTableLabels;
  final List<PandaTableDataRow> pandaTableDataRows;
  final Color? headingBackgroundColor;
  final Color? headingLabelColor;
  final Color? rowBackgroundColor;
  final Color? rowLabelColor;
  final Color? dividerColor;
  final int rowsPerPage;
  final bool isShowPagination;
  final void Function(int index)? onRowPressed;
  final void Function(int pageIndex)? onPageChanged;

  const PandaTable({
    Key? key,
    required this.pandaTableLabels,
    required this.pandaTableDataRows,
    this.headingBackgroundColor,
    this.headingLabelColor,
    this.rowBackgroundColor,
    this.rowLabelColor,
    this.dividerColor,
    this.rowsPerPage = 10,
    this.isShowPagination = true,
    this.onRowPressed,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<PandaTable> createState() => _PandaTableState();
}

class _PandaTableState extends State<PandaTable> {
  late PandaTableDataSource _pandaTableDataSource;
  // bool _sortAscending = true;
  // int? _sortColumnIndex;
  // bool _initialized = false;

  @override
  void initState() {
    _pandaTableDataSource = PandaTableDataSource(
      rows: widget.pandaTableDataRows,
      rowLabelColor: widget.rowLabelColor,
      rowBackgroundColor: widget.rowBackgroundColor,
      onRowPressed: widget.onRowPressed,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pandaTableDataSource.dispose();
    super.dispose();
  }

  // void sort<T>(
  //   Comparable<T> Function(dynamic label) getField,
  //   int columnIndex,
  //   bool ascending,
  // ) {
  //   _pandaTableDataSource.sort<T>(getField, ascending);
  //   setState(() {
  //     _sortColumnIndex = columnIndex;
  //     _sortAscending = ascending;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      smRatio: 0.75,
      lmRatio: 1.5,
      wrapInCard: false,
      hidePaginator: !widget.isShowPagination,
      sortColumnIndex: 1,
      sortAscending: true,
      sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
      sortArrowAnimationDuration: const Duration(milliseconds: 0),
      border: TableBorder.all(
        width: 1,
        color: widget.dividerColor ?? Colors.black38,
      ),
      rowsPerPage: widget.rowsPerPage,
      headingRowColor: MaterialStateProperty.resolveWith((states) {
        return widget.headingBackgroundColor;
      }),
      onPageChanged: ((pageIndex) {
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(pageIndex ~/ widget.rowsPerPage);
        }
      }),

      columns: widget.pandaTableLabels
          .map(
            (value) => DataColumn(
              // onSort: ((columnIndex, ascending) {
              //   print('column index: $columnIndex');
              //   print('ascending: $ascending');
              //   print('value label: ${value.label}');
              //   sort<dynamic>((d) => value.label, columnIndex, ascending);
              // }),
              label: PandaText(
                value.label,
                textColor: widget.headingLabelColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          .toList(),
      source: _pandaTableDataSource,
    );
  }
}

class PandaTableLabel {
  final String label;

  PandaTableLabel({
    this.label = '',
  });
}

class PandaTableDataRow {
  final String value;
  final bool isSelected;
  final List<PandaTableDataCell> pandaTableDataCells;

  PandaTableDataRow({
    this.value = '',
    this.isSelected = false,
    required this.pandaTableDataCells,
  });
}

class PandaTableDataCell {
  final dynamic value;

  PandaTableDataCell({
    this.value = '',
  });
}

//DATA SOURCE
class PandaTableDataSource extends DataTableSource {
  final List<PandaTableDataRow> rows;
  final Color? rowLabelColor;
  final Color? rowBackgroundColor;
  final void Function(int index)? onRowPressed;

  PandaTableDataSource({
    required this.rows,
    this.rowLabelColor,
    this.rowBackgroundColor,
    this.onRowPressed,
  });

  // void sort<T>(Comparable<T> Function(String d) getField, bool ascending) {
  //   print('sorting table');
  //   rows.sort((a, b) {
  //     // print('a: ${a.pandaTableDataCells[0].value}');
  //     // print('b: ${b.pandaTableDataCells[0].value}');
  //     final aValue = getField(a.pandaTableDataCells[0].value);
  //     final bValue = getField(b.pandaTableDataCells[0].value);
  //     // final aValue = getField(a.value);
  //     // final bValue = getField(b.value);
  //     // print('aValue: $aValue');
  //     // print('bValue: $bValue');
  //     return ascending
  //         ? Comparable.compare(aValue, bValue)
  //         : Comparable.compare(bValue, aValue);
  //   });
  //   notifyListeners();
  // }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rows.length) throw 'index > rows.length';
    final PandaTableDataRow row = rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.isSelected,
      color: MaterialStateProperty.resolveWith((states) {
        return rowBackgroundColor;
      }),
      cells: row.pandaTableDataCells
          .map(
            (pandaTableDataCell) => DataCell(
              PandaText(
                pandaTableDataCell.value,
                textColor: rowLabelColor,
              ),
              onTap: () {
                if (onRowPressed != null) {
                  onRowPressed!(index);
                }
              },
            ),
          )
          .toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;
}
