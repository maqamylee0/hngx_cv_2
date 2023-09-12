import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class EditPage extends StatefulWidget {
   EditPage({super.key, this.name, this.bio, this.slack_username, this.github_handle});
  final String? name;
  final String? bio;
  final String? slack_username;
  final String? github_handle;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController slackUsernamerController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name!;
    bioController.text = widget.bio!;
    slackUsernamerController.text = widget.slack_username!;
    githubHandleController.text = widget.github_handle!;

    super.initState();
  }
  _goToMainPage() {
    Navigator.pop(context, {
      "name": nameController.text,
      "bio": bioController.text,
      "slack_username": slackUsernamerController.text,
      "github_handle": githubHandleController.text
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Edit CV"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Full Name',
                ),
                controller: nameController,

              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Slack Username',
                ),

                controller: slackUsernamerController,

              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Github handle',
                ),

                controller: githubHandleController,

              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Bio',
                ),
                controller: bioController,
                maxLines: 5,
                minLines: 3,

              ),
              ElevatedButton(onPressed: _goToMainPage, child: Text("Save"))

            ],
          ),
        ),

      ),
    );
  }
}

