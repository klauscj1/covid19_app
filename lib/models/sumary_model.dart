import 'package:covid19_app/models/country_model.dart';
import 'package:covid19_app/models/global_model.dart';

class Sumary {
  Sumary({
    this.global,
    this.countries,
    this.date,
  });

  Global global;
  List<Country> countries;
  DateTime date;

  factory Sumary.fromJson(Map<String, dynamic> json) => Sumary(
        global: Global.fromJson(json["Global"]),
        countries: List<Country>.from(
            json["Countries"].map((x) => Country.fromJson(x))),
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Global": global.toJson(),
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "Date": date.toIso8601String(),
      };
}
