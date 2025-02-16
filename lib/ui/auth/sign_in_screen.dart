import 'package:flutter/material.dart';
import 'package:odas_trl_framework/routes.dart';

import 'package:provider/provider.dart';

import '../../providers/auth/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _emailController =
        TextEditingController(text: "enfelipesiqueira@gmail.com");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              //_buildBackground(),
              Align(
                alignment: Alignment.center,
                child: _buildForm(context),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildForm(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  //style: Theme.of(context).textTheme.body1,
                  validator: (value) => value!.isEmpty ? 'Invalid email' : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 32, 63, 88), // cor do rótulo
                      fontSize: 16, // tamanho da fonte do rótulo
                      fontWeight: FontWeight.bold, // peso da fonte do rótulo
                      // margem do rótulo (left, top, right, bottom)
                      // você pode ajustar os valores de acordo com a sua preferência
                    ),
                    //contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                    enabledBorder: UnderlineInputBorder(
                      //<-- SEE HERE
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    maxLength: 20,
                    controller: _passwordController,
                    //style: Theme.of(context).textTheme.body1,
                    validator: (value) =>
                        value!.length < 6 ? 'Invalid password' : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 32, 63, 88), // cor do rótulo
                        fontSize: 16, // tamanho da fonte do rótulo
                        fontWeight: FontWeight.bold, // peso da fonte do rótulo
                        // margem do rótulo (left, top, right, bottom)
                        // você pode ajustar os valores de acordo com a sua preferência
                      ),
                      counterStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide:
                            BorderSide(width: 3, color: Colors.greenAccent),
                      ),
                    ),
                  ),
                ),
                authProvider.status == Status.Authenticating
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context)
                                .unfocus(); //to hide the keyboard - if any

                            bool status =
                                await authProvider.signInWithEmailAndPassword(
                                    _emailController.text,
                                    _passwordController.text);

                            if (!status) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Invalid email and/or password',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 136, 50, 42),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              /*_scaffoldKey.currentState!.showSnackBar(SnackBar(
                                content: Text("Teste"),
                              ));*/
                            } else {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.home);
                            }
                          }
                        }),
                authProvider.status == Status.Authenticating
                    ? Center(
                        child: null,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Center(
                            child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                authProvider.status == Status.Authenticating
                    ? Center(
                        child: null,
                      )
                    : TextButton(
                        child: Text('Create account'),
                        //textColor: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          //Navigator.of(context)
                          //    .pushReplacementNamed(Routes.register);
                        },
                      ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    //Text(
                    //  Provider.of<Flavor>(context).toString(),
                    //  style: Theme.of(context).textTheme.body2,
                    //),
                  ],
                )),
              ],
            ),
          ),
        ));
  }

  Widget _buildBackground() {
    return ClipPath(
      clipper: SignInCustomClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

class SignInCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 95);
    var firstControlPoint = Offset(size.width / 6, size.height * 0.45);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height / 2 - 50);
    var secondControlPoint = Offset(size.width, size.height + 15);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
