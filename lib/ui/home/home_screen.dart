import 'package:flutter/material.dart';
import 'package:odas_trl_framework/routes.dart';

class HomeScreen extends StatelessWidget {
  final String organizationName = 'IEAPM';
  final List<String> userProjects = [
    'ODAS-Glider',
  ];
  final List<String> userProjectsDescrpt = [
    'First project using this methodology with procedures classified into TRL levels',
  ];
  final List<String> otherProjects = [
    'Project 2',
    'Project 3',
    'Project 4',
  ];
  final List<String> thirdPartyProjects = [
    'Project 5',
    'Project 6',
    'Project 7',
  ];
  final List<String> otherProjectsDescrpt = [
    'Project description',
    'Project description',
    'Project description',
  ];
  final List<String> thirdPartyProjectsDescrpt = [
    'Project description',
    'Project description',
    'Project description',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Organization: IEAPM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  ExpansionTile(
                    textColor: Color.fromARGB(255, 13, 53, 94),
                    collapsedTextColor: Colors.black,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                    collapsedBackgroundColor:
                        Color.fromRGBO(255, 255, 255, 0.6),
                    title: Text('My Projects'),
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: userProjects.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              userProjects[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Open'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                userProjectsDescrpt[index]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.newProject);
                    },
                    child: Text('New Project'),
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    textColor: Color.fromARGB(255, 13, 53, 94),
                    collapsedTextColor: Colors.black,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                    collapsedBackgroundColor:
                        Color.fromRGBO(255, 255, 255, 0.6),
                    title: Text('Projects by Author 2'),
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: otherProjects.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              otherProjects[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Open'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                otherProjectsDescrpt[index]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    textColor: Color.fromARGB(255, 13, 53, 94),
                    collapsedTextColor: Colors.black,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                    collapsedBackgroundColor:
                        Color.fromRGBO(255, 255, 255, 0.6),
                    title: Text('Projects by Author 3'),
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: thirdPartyProjects.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              thirdPartyProjects[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Open'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                thirdPartyProjectsDescrpt[
                                                    index]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
