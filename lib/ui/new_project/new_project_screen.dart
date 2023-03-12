import 'package:flutter/material.dart';

class NewProjectScreen extends StatefulWidget {
  @override
  _NewProjectScreenState createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  String _projectName = '';
  String _projectDescription = '';
  String _imageUrl = '';
  DateTime _startDate = DateTime.now();
  int _trlObjective = 1;
  String _composition = 'Hardware';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Project')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 15, 63, 134),
                Color.fromARGB(255, 18, 51, 78),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Project Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a project name';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() => _projectName = value!),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Project Description'),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a project description';
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        setState(() => _projectDescription = value!),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.image),
                    label: Text('Add Image'),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Start Date'),
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _startDate,
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() => _startDate = date);
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select a start date';
                      }
                      return null;
                    },
                    controller: TextEditingController(
                      text:
                          '${_startDate.day}/${_startDate.month}/${_startDate.year}',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: 'Target TRL'),
                    value: _trlObjective,
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('TRL 1-3'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('TRL 4-6'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('TRL 7-9'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _trlObjective = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a Target TRL';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Project Type'),
                    value: _composition,
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Hardware and Software',
                        child: Text('Hardware and Software'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Hardware',
                        child: Text('Only Hardware'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Software',
                        child: Text('Only Software'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _composition = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a Project Type';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
// TODO: Implement project creation logic
                      }
                    },
                    child: Text('Create Project'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
