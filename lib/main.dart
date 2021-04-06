// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'dart:html' as html;
// import 'package:http/http.dart' as http;

// const String clientId = "sxpdjo9n7cwj0i9gbn6dphz67shbj5";

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _showUserData = false;
//   String? _token;

//   Future<String> _validateToken() async {
//     final response = await http.get(
//       Uri.parse('https://id.twitch.tv/oauth2/validate'),
//       headers: {'Authorization': 'OAuth $_token'},
//     );
//     return (jsonDecode(response.body) as Map<String, dynamic>)['login']
//         .toString();
//   }

//   @override
//   void initState() {
//     super.initState();

//     final currentUrl = Uri.base;

//     print(currentUrl);

//     if (!currentUrl.fragment.contains('access_token=')) {
//       print('does not contain');
//       // You are not connected so redirect to the Twitch authentication page.
//       WidgetsBinding.instance!.addPostFrameCallback((_) {
//         html.window.location.assign(
//           'https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=$clientId&redirect_uri=${currentUrl.origin}&scope=viewing_activity_read',
//         );
//       });
//     } else {
//       print('does contain');
//       // You are connected, you can grab the code from the url.
//       final fragments = currentUrl.fragment.split('&');
//       _token = fragments
//           .firstWhere((e) => e.startsWith('access_token='))
//           .substring('access_token='.length);

//       print(_token);
//       WidgetsBinding.instance!
//           .addPostFrameCallback((_) => setState(() => _showUserData = true));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Twitch web login')),
//       body: Center(
//         child: _showUserData
//             ? FutureBuilder<String>(
//                 future: _validateToken(),
//                 builder: (_, snapshot) {
//                   if (!snapshot.hasData) return CircularProgressIndicator();
//                   return Container(child: Text('Welcome ${snapshot.data}'));
//                 },
//               )
//             : Container(),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

const String clientId = '7f0f1b0b8726b03b4376';
const String clientSecret = 'cb03796f5bdce1096c29e71542b1446d0c89b180';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showUserData = false;
  String? _token;
  String? _token1;

  Future<String> _validateToken() async {
    final response = await http.get(
      Uri.parse('https://github.com/login/oauth/validate'),
      headers: {'Authorization': 'OAuth $_token'},
      // body: {
      //   "client_id": clientId,
      //   "client_secret": clientSecret,
      //   "code": _token
      // },
    );
    return (jsonDecode(response.body) as Map<String, dynamic>)['login']
        .toString();
  }

  // Future<http.Response> fetchAlbum() {
  //   return http.get(Uri.https('www.github.com',
  //       '/login/oauth/authorize?client_id=$clientId&scope=user,gist,user:email'));
  // }

  // void getHttp() async {
  //   try {
  //     var response = await Dio()
  //         .get('https://github.com/login/oauth/authorize', queryParameters: {
  //       "client_id": '7f0f1b0b8726b03b4376' ,
  //       "scope": "user,gist,user:email",
  //     });
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();

    final currentUrl = Uri.base;

    print(currentUrl.hasQuery);

    // if (currentUrl.queryParameters.containsKey('code')) {
    //   final code = currentUrl.queryParameters.containsKey('code');
    //   print(code);
    // }

    if (!currentUrl.fragment.contains('access_token=')) {
      // You are not connected so redirect to the Twitch authentication page.
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          print('in post callback');

          html.window.location.assign(
            'https://github.com/login/oauth/authorize?client_id=$clientId&scope=user,gist,user:email',
          );
        },
      );
    } else {
      print('fragment contain');
      // You are connected, you can grab the code from the url.
      final fragments = currentUrl.fragment.split('&');
      _token = fragments
          .firstWhere((e) => e.startsWith('access_token='))
          .substring('access_token='.length);
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) => {
          print(Uri),
          setState(() => _showUserData = true),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Twitch web login')),
      body: Center(
        child: _showUserData
            ? FutureBuilder<String>(
                future: _validateToken(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return Container(child: Text('Welcome ${snapshot.data}'));
                },
              )
            : Container(),
      ),
    );
  }
}
//
//
//
//
//
//
//
//
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'dart:html' as html;
// import 'package:http/http.dart' as http;

// /// Client id provided by Twitch
// const String clientId = "zyk7civhngdpjya2sy2an82eheusul";

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _token;
//   html.WindowBase _popupWin;

//   Future<String> _validateToken() async {
//     final response = await http.get(
//       Uri.parse('https://id.twitch.tv/oauth2/validate'),
//       headers: {'Authorization': 'OAuth $_token'},
//     );
//     return (jsonDecode(response.body) as Map<String, dynamic>)['login']
//         .toString();
//   }

//   void _login(String data) {
//     /// Parse data to extract the token.
//     final receivedUri = Uri.parse(data);

//     /// Close the popup window
//     if (_popupWin != null) {
//       _popupWin.close();
//       _popupWin = null;
//     }

//     setState(() => _token = receivedUri.fragment
//         .split('&')
//         .firstWhere((e) => e.startsWith('access_token='))
//         .substring('access_token='.length));
//   }

//   @override
//   void initState() {
//     super.initState();

//     /// Listen to message send with `postMessage`.
//     html.window.onMessage.listen((event) {
//       /// The event contains the token which means the user is connected.
//       if (event.data.toString().contains('access_token=')) {
//         _login(event.data);
//       }
//     });

//     /// You are not connected so open the Twitch authentication page.
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final currentUri = Uri.base;
//       final redirectUri = Uri(
//         host: currentUri.host,
//         scheme: currentUri.scheme,
//         port: currentUri.port,
//         path: '/static.html',
//       );
//       final authUrl =
//           'https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=$clientId&scope=viewing_activity_read';
//       _popupWin = html.window.open(
//           authUrl, "Twitch Auth", "width=800, height=900, scrollbars=yes");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Twitch web login')),
//       body: Center(
//         child: _token != null && _token.isNotEmpty
//             ? FutureBuilder<String>(
//                 future: _validateToken(),
//                 builder: (_, snapshot) {
//                   if (!snapshot.hasData) return CircularProgressIndicator();
//                   return Container(child: Text('Welcome ${snapshot.data}'));
//                 },
//               )
//             : Container(
//                 child: Text('You are not connected'),
//               ),
//       ),
//     );
//   }
// }
