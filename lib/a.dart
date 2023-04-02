import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        decoration: const BoxDecoration(
          color: Colors.pink,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 7,
                ),
                child: Image.asset(
                  "assets/noun-book-21025.png",
                  height: 125,
                ),
              ),
              const Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Esse e-mail parece curto demais";
                        } else if (!value.contains("@")) {
                          return "Esse e-mail está meio estranho, não?";
                        }
                        return null;
                      },
                      controller: _mailInputController,
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return "A senha deve ter pelo menos 6 caracteres";
                        }
                        return null;
                      },
                      obscureText: _obscurePassword,
                      controller: _passwordInputController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _obscurePassword,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _obscurePassword = newValue!;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Mostrar senha",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              const Text(
                "Ainda não tem uma conta?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("Cadastre-se"),
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<LoginModel> _getSavedUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String jsonUser = prefs.getString(PreferencesKeys.activeUser);
  //   print(jsonUser);

  //   Map<String, dynamic> mapUser = json.decode(jsonUser);
  //   LoginModel user = LoginModel.fromJson(mapUser);
  //   return user;
  // }
}
