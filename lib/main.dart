import 'package:flutter/material.dart';

import 'editPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  String name = "Emmilly Immaculate Namuganga";
  String bio = "I am a flutter mobile developer";
  String slack_username = "emmilly namuganga";
  String github_handle = "maqamylee0";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        name: name,
        bio: bio,
        slack_username: slack_username,
        github_handle: github_handle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {super.key,
      this.name,
      this.bio,
      this.slack_username,
      this.github_handle});

  String? name;
  String? bio;
  String? slack_username;
  String? github_handle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _goToEdit() async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditPage(
                name: widget.name,
                bio: widget.bio,
                slack_username: widget.slack_username,
                github_handle: widget.github_handle)));

    if (result != null) {
      setState(() {
        widget.name = result["name"];
        widget.bio = result["bio"];
        widget.github_handle = result["github_handle"];
        widget.slack_username = result["slack_username"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My CV"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            VerticalDivider(
              indent: 3,
              thickness: 2,
              width: 4,
              color: Colors.purple,
              endIndent: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 15,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Personal Information",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Full Name",
                                        style:
                                            Theme.of(context).textTheme.headlineSmall)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  child: Text("${widget.name}",
                                      style: Theme.of(context).textTheme.titleLarge),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Slack Username",
                                        style:
                                        Theme.of(context).textTheme.headlineSmall)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  child: Text("${widget.slack_username}",
                                      style: Theme.of(context).textTheme.titleLarge),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Github handle",
                                        style:
                                        Theme.of(context).textTheme.headlineSmall)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  child: Text("${widget.github_handle}",
                                      style: Theme.of(context).textTheme.titleLarge),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Bio",
                                        style:
                                        Theme.of(context).textTheme.headlineSmall)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  child: Text("${widget.bio}",
                                      style: Theme.of(context).textTheme.titleLarge),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToEdit,
        tooltip: 'Edit Details',
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
