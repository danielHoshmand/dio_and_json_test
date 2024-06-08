import 'package:dio/dio.dart';
import 'package:dio_and_json_test/http_service.dart';
import 'package:dio_and_json_test/model/single_user_response.dart';
import 'package:dio_and_json_test/model/user.dart';
import 'package:flutter/material.dart';

class SignleUserScreen extends StatefulWidget {
  const SignleUserScreen({super.key});

  @override
  State<SignleUserScreen> createState() => _SignleUserScreenState();
}

class _SignleUserScreenState extends State<SignleUserScreen> {
  late HttpService http;
  late SingleUserResponse _singleUserResponse;
  late User _user;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    http = HttpService();
    getSignleUser();
  }

  Future getSignleUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getRequest('api/users/7');
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          _singleUserResponse = SingleUserResponse.fromJson(response.data);
          _user = _singleUserResponse.user;
        });
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Single User'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _user != null
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(_user.avatar),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('${_user.firstName} ${_user.lastName}')
                    ],
                  ),
                )
              : const Center(
                  child: Text('No User Object'),
                ),
    );
  }
}
