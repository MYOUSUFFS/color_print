import 'package:color_print/style/text.dart';
import 'package:flutter/material.dart';
import 'package:myself/myself.dart';
import 'package:provider/provider.dart';

import '../../data.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final MyValidation _validator = MyValidation();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ifscController = TextEditingController();
  TextEditingController _accNumController = TextEditingController();
  TextEditingController _mobileNumController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _gstController = TextEditingController();
  TextEditingController _panNumberController = TextEditingController();
  TextEditingController _aadhaarNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _dataIs = Provider.of<DataIs>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation Demo'),
        actions: [
          Switch(
            value: _dataIs.themeIsDark,
            onChanged: (value) {
              _dataIs.changeTheme(value);
            },
          ),
          Text("Theme\nMode", style: MyText.heading.copyWith(fontSize: 14)),
          SizedBox(width: 10)
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: _validator.nameValidator,
              ),
              TextFormField(
                controller: _mobileNumController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: _validator.mobileNumValidator,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: _validator.emailValidator,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: _validator.passwordValidator,
              ),
              TextFormField(
                controller: _ifscController,
                decoration: InputDecoration(labelText: 'IFSC'),
                validator: _validator.ifscValidator,
              ),
              TextFormField(
                controller: _accNumController,
                decoration: InputDecoration(labelText: 'Account Number'),
                validator: _validator.accNumValidator,
              ),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: _validator.fullNameValidate,
              ),
              TextFormField(
                controller: _gstController,
                decoration: InputDecoration(labelText: 'GST Number'),
                validator: _validator.gstValidator,
              ),
              TextFormField(
                controller: _panNumberController,
                decoration: InputDecoration(labelText: 'PAN Number'),
                validator: _validator.panNumberValidator,
              ),
              TextFormField(
                controller: _aadhaarNumberController,
                decoration: InputDecoration(labelText: 'Aadhaar Number'),
                validator: _validator.aadhaarNumberValidator,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, do something
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form is valid')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
