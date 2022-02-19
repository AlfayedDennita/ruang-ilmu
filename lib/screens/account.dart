import 'package:flutter/material.dart';
import 'package:ruang_ilmu/widgets/top_navbar.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _formKey = GlobalKey<FormState>();

  Widget textFormField({
    required String hintText,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      obscureText: obscureText,
      cursorHeight: 21,
      cursorColor: Colors.grey[800],
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Kolom ini wajib diisi!';
        }
        return null;
      },
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.style, size: 20, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                'RUANG ILMU',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          textFormField(
            hintText: 'Alamat Surel (Email)',
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          textFormField(
            hintText: 'Kata Sandi',
            icon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Lupa kata sandi?',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                _formKey.currentState?.validate();
              },
              child: const Text(
                'Masuk/Daftar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: <Widget>[
                topNavbar(context, screenName: 'Akun'),
                const SizedBox(height: 64),
                form(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
