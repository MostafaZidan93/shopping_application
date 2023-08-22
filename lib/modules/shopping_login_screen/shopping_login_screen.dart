import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/shared/components.dart';
import 'package:shopping_application/shared/styles/colors.dart';

import '../shopping_register_screen/shopping_register_screen.dart';

class ShopLoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //var textFormFieldKey = ScaffoldState<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Login now to see What's new",
                    style: Theme.of(context).textTheme.bodyMedium,),
                SizedBox(
                  height: 60,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (String? value) {
                    if(value == null || value.isEmpty)
                      return "Email Field is empty";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Email Account"),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  validator: (String? value) {
                    if(value == null || value.isEmpty)
                      return "Password is Too Short";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                TextButton(
                    onPressed: (){},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                          "LogIn".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                      ),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don\'t have an account ?"),
                    defaultTextButton(
                        textTitle: "Register",
                        function: (){
                          navigateTo(context, ShoppingRegisterScreen());
                        },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
