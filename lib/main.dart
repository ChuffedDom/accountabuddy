import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accountabuddy',
      theme: ThemeData(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool mobile = false;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width < 960 ? mobile = true : mobile = false;
    String backgroundImage =
        "https://images.unsplash.com/photo-1593132517397-ceb31d77194a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80";
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: mobile
            ? ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: ValueProposition(),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      border: const Border(
                        top: BorderSide(),
                        bottom: BorderSide(color: Colors.white),
                        right: BorderSide(color: Colors.white),
                        left: BorderSide(color: Colors.white),
                      ),
                    ),
                    child: SignUpForm(),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: ValueProposition(),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      border: const Border(
                        top: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white),
                        right: BorderSide(color: Colors.white),
                        left: BorderSide(),
                      ),
                    ),
                    child: SignUpForm(),
                  )
                ],
              ),
      ),
    );
  }
}

class ValueProposition extends StatelessWidget {
  const ValueProposition({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Accountabuddy",
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displaySmall,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "Accountability in your pocket: Reach your goals with ease",
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.titleMedium,
                color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            "We will help you achieve your goals by providing a unique accountability system via text messages. With regular check-ins from your buddy, we make it easy to become the version of yourself you want to be.",
            style: GoogleFonts.cabin(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Sign up and get a free Accountabuddy today",
            style: GoogleFonts.cabin(
                textStyle: Theme.of(context).textTheme.titleLarge),
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: "email",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: "Phone number",
              border: OutlineInputBorder(),
            ),
          ),
          MyForm(),
          ElevatedButton(onPressed: () {}, child: Text("Sign Up"))
        ],
      ),
    );
  }
}

enum Options { option1, option2, option3 }

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  Options _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'How do you want to be reached:',
            style: GoogleFonts.cabin(
                textStyle: Theme.of(context).textTheme.bodyLarge),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: <Widget>[
                  Radio<Options>(
                    value: Options.option1,
                    groupValue: _selectedOption,
                    onChanged: (Options? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  Text(
                    'Whatsapp',
                    style: GoogleFonts.cabin(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio<Options>(
                    value: Options.option2,
                    groupValue: _selectedOption,
                    onChanged: (Options? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  Text(
                    'Telegram',
                    style: GoogleFonts.cabin(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio<Options>(
                    value: Options.option3,
                    groupValue: _selectedOption,
                    onChanged: (Options? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  Text(
                    'Signal',
                    style: GoogleFonts.cabin(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
