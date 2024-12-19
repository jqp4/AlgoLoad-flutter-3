// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';

// part 'login_form_dto.freezed.dart';
// // part 'login_form_dto.g.dart';

// @freezed
// class LoginFormDto with _$LoginFormDto {
//   const factory LoginFormDto({
//     @JsonKey(name: 'username') required String userName,
//     @JsonKey(name: 'password') required String userPassword,
//     @JsonKey(name: 'submit') required String submitText,
//   }) = _LoginFormDto;

//   factory LoginFormDto.fromJson(Map<String, dynamic> json) => _$LoginFormDtoFromJson(json);
// }

// extension LoginFormX on LoginForm {
//   // todo: remove
//   // void wef() {
//   //   final s = LoginForm(
//   //     userName: '2',
//   //     userPassword: '1',
//   //     submitText: '3',
//   //   ).toDto().toString();
//   // }

//   LoginFormDto toDto() => LoginFormDto(
//         userName: userName,
//         userPassword: userPassword,
//         submitText: submitText,
//       );
// }

// extension LoginFormDtoX on LoginFormDto {
//   LoginForm toEntity() => LoginForm(
//         userName: userName,
//         userPassword: userPassword,
//         submitText: submitText,
//       );
// }
