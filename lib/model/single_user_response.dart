import 'package:dio_and_json_test/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse {
  @JsonKey(name : 'data')
  final User user;

  SingleUserResponse(this.user);

    /// Connect the generated [_$SingleUserResponseFromJson] function to the `fromJson`
  /// factory.
  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);

  /// Connect the generated [_$SingleUserResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}
