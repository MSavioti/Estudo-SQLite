import 'package:estudo_sqlite/shared/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();

  String? _validateTextField(String? inputText) {
    if ((inputText == null) || (inputText.isEmpty)) {
      return 'This field can\'t be left blank';
    }

    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _genderController.dispose();
    _sectorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = Gender.undisclosed.toString().split('.').last;
    bool? isOutSourced = false;
    Level currentLevel = Level.trainee;

    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  validator: _validateTextField,
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Employee\'s name...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  autofocus: true,
                  validator: _validateTextField,
                  controller: _dateController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Birth date',
                    hintText: 'Tap to choose date...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (date != null) {
                      _dateController.text = date.toString().substring(0, 10);
                    }
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField(
                  value: dropdownValue,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Gender',
                    hintText: 'Choose (or not) a gender...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: Gender.values
                      .map<DropdownMenuItem<String>>((Gender gender) {
                    String genderName = gender.toString().split('.').last;
                    return DropdownMenuItem<String>(
                      value: genderName,
                      child: Text(genderName),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  autofocus: true,
                  validator: _validateTextField,
                  controller: _sectorController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Sector',
                    hintText: 'Where the employee works...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Radio<Level>(
                  value: currentLevel,
                  groupValue: currentLevel,
                  onChanged: (Level? newLevel) {
                    if (newLevel != null) {
                      setState(() {
                        currentLevel = newLevel;
                      });
                    }
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Is this employee outsourced?'),
                    Checkbox(
                      value: isOutSourced,
                      onChanged: (bool? newValue) {
                        print(newValue);
                        setState(() {
                          if (newValue != null) {
                            isOutSourced = newValue;
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: Text('Submit'),
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
