import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';

class LoginScreen extends StatelessWidget {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,

            child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email){
                  if(!emailValid(email))
                    return 'E-mail Inválido!';
                  return null;
                }
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(hintText: 'Senha'),
                autocorrect: false,
                obscureText: true,
                validator: (pass){
                  if(pass.isEmpty || pass.length < 6)
                    return 'Senha Inválida';
                  return null;
                }
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: (){

                  },
                  padding: EdgeInsets.zero,
                  textColor: Colors.teal[300],
                  child: const Text('Esqueci minha senha')
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 44,
                child: RaisedButton(
                onPressed: (){
                 if( formkey.currentState.validate()){
                   print(emailController.text);

                 }
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Entrar', style: TextStyle(fontSize: 18),),
                
              ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}