
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension formatDate on DateTime {
  String toDMY() => DateFormat("yyyy-MM-dd").format(this.toLocal());

  String toDMYHM() => DateFormat("yyyy-MM-dd HH:mm").format(this.toLocal());

  String toYM() => DateFormat("yyyy-MM").format(this.toLocal());

  String toFormattedDate() {
    initializeDateFormatting();
    return DateFormat.yMMMMd('id').format(this.toLocal());
  }

  String toFormattedMonth() {
    initializeDateFormatting();
    return DateFormat.yMMMM('id').format(this.toLocal());
  }

  String toFormattedDateHour() {
    initializeDateFormatting();
    return '${DateFormat.yMMMMd('id').format(this.toLocal())}, ${DateFormat("HH:mm").format(this.toLocal())}';
  }
}

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

String twoDigit(int val) {
  if (val < 10) {
    return "0$val";
  } else {
    return "$val";
  }
}

extension formatString on String {
  String twoDigit() {
    if (this == '') {
      return '';
    } else if (this == '-') {
      return '-';
    }
    if (int.parse(this) < 10) {
      return "0$this";
    } else {
      return "$this";
    }
  }

  String formatRupiah() {
    if (this == '') {
      return '';
    } else if (this == '-') {
      return '-';
    } else {
      final oCcy = new NumberFormat(" #,##0", "id_ID");
      return oCcy.format(int.parse(this));
    }
  }

  String toFormattedDate() {
    if (this == '') return '';
    DateTime dateTime = DateTime.parse(this).toLocal();
    return dateTime.toFormattedDate();
  }


  String toFormattedDateHour() {
    initializeDateFormatting();
    DateTime date = DateTime.parse(this).toLocal();
    return '${DateFormat.yMMMMd('id').format(date)}, ${DateFormat("HH:mm").format(date)}';
  }

  DateTime toDateTime() {
    return DateTime.parse(this).toLocal();
  }

  String toJamMenit() {
    if (this == '' || this == '-') return this;
    return '${this.split(":")[0]}:${this.split(":")[1]}';
  }


}
