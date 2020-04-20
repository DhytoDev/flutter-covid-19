
import 'package:domain/model/cases.dart';

class CasesResponse {
  Confirmed confirmed;
  Deaths deaths;
  String lastUpdate;
  Recovered recovered;

  CasesResponse({this.confirmed, this.deaths, this.lastUpdate, this.recovered});

  factory CasesResponse.fromJson(Map<String, dynamic> json) {
    return CasesResponse(
      confirmed: json['confirmed'] != null ? Confirmed.fromJson(
          json['confirmed']) : null,
      deaths: json['deaths'] != null ? Deaths.fromJson(json['deaths']) : null,
      lastUpdate: json['lastUpdate'],
      recovered: json['recovered'] != null ? Recovered.fromJson(
          json['recovered']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    if (this.confirmed != null) {
      data['confirmed'] = this.confirmed.toJson();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths.toJson();
    }
    if (this.recovered != null) {
      data['recovered'] = this.recovered.toJson();
    }
    return data;
  }

  Cases toCases() {
    return Cases(confirmed.value, deaths.value, recovered.value, lastUpdate);
  }
}

class Recovered {
  String detail;
  int value;

  Recovered({this.detail, this.value});

  factory Recovered.fromJson(Map<String, dynamic> json) {
    return Recovered(
      detail: json['detail'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['value'] = this.value;
    return data;
  }
}

class Confirmed {
  String detail;
  int value;

  Confirmed({this.detail, this.value});

  factory Confirmed.fromJson(Map<String, dynamic> json) {
    return Confirmed(
      detail: json['detail'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['value'] = this.value;
    return data;
  }
}

class Deaths {
  String detail;
  int value;

  Deaths({this.detail, this.value});

  factory Deaths.fromJson(Map<String, dynamic> json) {
    return Deaths(
      detail: json['detail'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['value'] = this.value;
    return data;
  }
}