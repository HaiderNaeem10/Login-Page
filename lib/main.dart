
import 'package:flutter/material.dart';

void main() {
runApp(MaterialApp(
debugShowCheckedModeBanner: false,
home: Signup(),
));
}

String savedUser = "";
String savedPass = "";

Widget inputBox(String text, TextEditingController c,
{bool password = false}) {
return TextField(
controller: c,
obscureText: password,
decoration: InputDecoration(
labelText: text,
border: OutlineInputBorder(),
),
);
}

class Signup extends StatelessWidget {
final user = TextEditingController();
final pass = TextEditingController();
final confirm = TextEditingController();

Signup({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Sign Up")),
body: Padding(
padding: EdgeInsets.all(25),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
"Create Account",
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 20),

inputBox("Username", user),
SizedBox(height: 12),

inputBox("Password", pass, password: true),
SizedBox(height: 12),

inputBox(
"Confirm Password",
confirm,
password: true,
),

SizedBox(height: 20),

ElevatedButton(
onPressed: () {

// Username must contain letters only
bool onlyLetters =
RegExp(r'^[a-zA-Z]+$')
    .hasMatch(user.text.trim());

if (user.text.trim().isEmpty) {
showMessage(
context,
"Username is required",
);
}

else if (!onlyLetters) {
showMessage(
context,
"Username must contain characters only",
);
}

else if (user.text.trim().length < 3) {
showMessage(
context,
"Username must be at least 3 characters",
);
}

else if (pass.text.isEmpty) {
showMessage(
context,
"Password is required",
);
}

else if (pass.text.length < 6) {
showMessage(
context,
"Password must be at least 6 characters",
);
}

else if (confirm.text.isEmpty) {
showMessage(
context,
"Please confirm your password",
);
}

else if (pass.text != confirm.text) {
showMessage(
context,
"Passwords do not match",
);
}

else {
savedUser = user.text.trim();
savedPass = pass.text;

Navigator.push(
context,
MaterialPageRoute(
builder: (_) => Login(),
),
);
}
},

child: Text("Sign Up"),
),
],
),
),
);
}
}

class Login extends StatelessWidget {
final user = TextEditingController();
final pass = TextEditingController();

Login({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Login")),

body: Padding(
padding: EdgeInsets.all(25),

child: Column(
mainAxisAlignment: MainAxisAlignment.center,

children: [
Text(
"Login",
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 20),

inputBox("Username", user),
SizedBox(height: 12),

inputBox(
"Password",
pass,
password: true,
),

SizedBox(height: 20),

ElevatedButton(
onPressed: () {

if (user.text.trim().isEmpty) {
showMessage(
context,
"Username is required",
);
}

else if (pass.text.isEmpty) {
showMessage(
context,
"Password is required",
);
}

else if (user.text.trim() == savedUser &&
pass.text == savedPass) {

Navigator.push(
context,
MaterialPageRoute(
builder: (_) => Profile(),
),
);

}

else {
showMessage(
context,
"Wrong username or password",
);
}
},

child: Text("Login"),
),
],
),
),
);
}
}

class Profile extends StatelessWidget {
const Profile({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("My Profile"),
),

body: SingleChildScrollView(
child: Column(
children: [

SizedBox(height: 25),

CircleAvatar(
radius: 70,
backgroundImage:
AssetImage("Image/Image.png"),
),

SizedBox(height: 15),

Text(
 "Haider Naeem",
style: TextStyle(
fontSize: 27,
fontWeight: FontWeight.bold,
),
),

Text("BS Software Engineering"),

SizedBox(height: 25),

info(
"Date of Birth",
"03-03-2007",
),

info(
"Location",
"Pakistan",
),

info(
"Education",
"BS Software Engineering",
),

info(
"Skills",
"C++, Java, Python",
),

info(
"Languages",
"English, Urdu",
),
],
),
),
);
}
}

Widget info(String title, String value) {
return ListTile(
leading: Icon(Icons.info),
title: Text(title),
subtitle: Text(value),
);
}

void showMessage(BuildContext context, String message) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(message),
),
);
}
