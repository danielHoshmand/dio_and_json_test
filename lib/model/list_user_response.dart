// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:dio_and_json_test/model/user.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'per_page')
  int per_page;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'total_pages')
  int total_pages;

  @JsonKey(name: 'data')
  List<User> users;

  ListUserResponse({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.users,
  });

      /// Connect the generated [_$ListUserResponseFromJson] function to the `fromJson`
  /// factory.
  factory ListUserResponse.fromJson(Map<String, dynamic> json) => _$ListUserResponseFromJson(json);

  /// Connect the generated [_$SingleUserResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}
