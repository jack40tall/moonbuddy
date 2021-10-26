import 'package:flutter/material.dart';
import 'package:frontend/components/mat_button.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/data_models/strategy_model.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:openapi/api.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final passwordText = TextEditingController();
  final passwordRetypeText = TextEditingController();
  bool showSpinner = false;
  String email;
  String password;
  String passwordRetype;
  String firstName;
  String lastName;
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Sign up to gain access to the world of trading robots',
                      style: TextStyle(color: kSecondaryPinkDark, fontSize: 16))
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              TextFormField(
                  cursorColor: kSecondaryPinkDark,
                  style: TextStyle(color: kSecondaryPinkDark),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: kSecondaryPinkDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)))),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  style: TextStyle(color: kSecondaryPinkDark),
                  obscureText: true,
                  controller: passwordText,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: kSecondaryPinkDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)))),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  style: TextStyle(color: kSecondaryPinkDark),
                  controller: passwordRetypeText,
                  obscureText: true,
                  onChanged: (value) {
                    passwordRetype = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Re-enter your password',
                      hintStyle: TextStyle(color: kSecondaryPinkDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)))),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  cursorColor: kSecondaryPinkDark,
                  style: TextStyle(color: kSecondaryPinkDark),
                  onChanged: (value) {
                    firstName = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'First name',
                      hintStyle: TextStyle(color: kSecondaryPinkDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)))),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  cursorColor: kSecondaryPinkDark,
                  style: TextStyle(color: kSecondaryPinkDark),
                  onChanged: (value) {
                    lastName = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Last name',
                      hintStyle: TextStyle(color: kSecondaryPinkDark),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kSecondaryPinkDark)))),
              SizedBox(
                height: 8.0,
              ),
              Container(
                alignment: Alignment(0.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 44,
                  elevation: 16,
                  hint: Text(
                    "Select investment strategy",
                  ),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  //TODO: Refactor
                  items: <String>[
                    "Safe",
                    "Conservative",
                    "Moderate",
                    "Aggressive"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              MatButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () => registerIsClicked(),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerIsClicked() {
    if (dropdownValue == null ||
        email == null ||
        firstName == null ||
        lastName == null ||
        password == null ||
        passwordRetype == null) {
      showPrompt('Fill in missing fields');
    } else if (password != passwordRetype) {
      passwordText.clear();
      passwordRetypeText.clear();
      showPrompt('Passwords do not match');
    } else if (password.length < 8) {
      passwordText.clear();
      passwordRetypeText.clear();
      showPrompt('Password must be at least 8 characters');
    } else {
      registerUser();
    }
  }

  Future<void> registerUser() async {
    // Check if user exists
    // Add user to database and move to the main page
    User currUser;
    final apiInstance = UsersApi();
    int selectedStrategy;
    //TODO: Refactor
    switch (dropdownValue) {
      case "Safe":
        {
          selectedStrategy = 1;
        }
        break;
      case "Conservative":
        {
          selectedStrategy = 2;
        }
        break;
      case "Moderate":
        {
          selectedStrategy = 3;
        }
        break;
      case "Aggressive":
        {
          selectedStrategy = 4;
        }
        break;
    }

    try {
      final result = apiInstance.usersPost(
          inlineObject1: InlineObject1(
              emailAddress: this.email,
              password: this.password,
              firstName: this.firstName,
              middleName: 'REMOVE THIS',
              lastName: this.lastName,
              investmentStrategy: selectedStrategy));
      var response = await result;
      // currUser = User(1, "hi", "first", "middle", "lastName", 2);
      currUser = User(
          response.userId,
          response.emailAddress,
          response.firstName,
          response.middleName,
          response.lastName,
          response.investmentStrategy,
          response.token);
      print(currUser);
      if (currUser != Null) {
        Navigator.popAndPushNamed(context, MainScreen.id, arguments: currUser);
      }
    } catch (e) {
      print('Exception when calling UserApi->usersPost(): $e\n');
      showPrompt("Email already taken");
    }
  }

  //TODO: Refactor
  Future<List<InvestmentStrategy>> fetchStrategies() async {
    List<InvestmentStrategy> strategyData = [];
    final apiInstance = StrategiesApi();

    try {
      final result = apiInstance.strategiesGet();
      var response = await result;

      response.strategies.forEach((current) => {
            strategyData.add(InvestmentStrategy(
                strategyId: current.investmentStrategyId,
                strategyName: current.investmentStrategyName,
                lowerRiskBound: current.riskLowerBound,
                upperRiskBound: current.riskUpperBound,
                description: current.strategyDescription))
          });
      return strategyData;
    } catch (e) {
      print('Exception when calling StrategiesApi->strategies.get(): $e\n');
      return null;
    }
  }

//Todo: Refactor
  void showPrompt(String prompt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(prompt,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: kBackgroundDark,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
