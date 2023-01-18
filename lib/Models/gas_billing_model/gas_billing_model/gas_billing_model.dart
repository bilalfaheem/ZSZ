import 'package:collection/collection.dart';

import 'current_month.dart';
import 'response.dart';

class GasBillingModel {
  int? status;
  String? message;
  List<Response>? response;
  List<CurrentMonth>? currentMonth;

  GasBillingModel({
    this.status,
    this.message,
    this.response,
    this.currentMonth,
  });

  factory GasBillingModel.fromJson(Map<dynamic, dynamic> json) {
    return GasBillingModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentMonth: (json['current_month'] as List<dynamic>?)
          ?.map((e) => CurrentMonth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'response': response?.map((e) => e.toJson()).toList(),
        'current_month': currentMonth?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GasBillingModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^
      message.hashCode ^
      response.hashCode ^
      currentMonth.hashCode;
}
