import 'package:dio/dio.dart';
import 'package:dio_and_json_test/http_service.dart';
import 'package:dio_and_json_test/model/list_user_response.dart';
import 'package:dio_and_json_test/model/user.dart';
import 'package:flutter/material.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({super.key});

  @override
  State<ListUserScreen> createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  late HttpService http;
  late ListUserResponse listUserResponse;
  late List<User> users;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    http = HttpService();
    getUsers();
  }

  Future getUsers() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getRequest('/api/users?page=2');
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response.data);
          users = listUserResponse.users;
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
        title: Text('Users'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : users != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.firstName),
                      leading: Image.network(user.avatar),
                      subtitle: Text(user.email),
                    );
                  },
                  itemCount: users.length,
                )
              : const Text('No User Object'),
    );
  }
}
