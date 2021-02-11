import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: const Text('Entrar', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: formkey,
              child: Consumer<UserManager>(
                builder: (_, userManager, __) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                          enabled: !userManager.loading,
                          controller: emailController,
                          decoration: const InputDecoration(hintText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (email) {
                            if (!emailValid(email)) return 'E-mail Inválido!';
                            return null;
                          }),
                      const SizedBox(height: 16),
                      TextFormField(
                          enabled: !userManager.loading,
                          controller: passController,
                          decoration: const InputDecoration(hintText: 'Senha'),
                          autocorrect: false,
                          obscureText: true,
                          validator: (pass) {
                            if (pass.isEmpty || pass.length < 6)
                              return 'Senha Inválida';
                            return null;
                          }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            textColor: Color(0xff9cbeff),
                            child: const Text('Esqueci minha senha')),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formkey.currentState.validate()) {
                                    userManager.signIn(
                                        user: User(
                                            email: emailController.text,
                                            password: passController.text),
                                        onFail: (e) {
                                          scaffoldkey.currentState
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('Falha ao entrar! $e'),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        onSuccess: () {
                                          //TODO: fechar tela de login
                                        });
                                  }
                                },
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          child: userManager.loading
                              ? SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  ),
                                )
                              : Text(
                                  'Entrar',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
