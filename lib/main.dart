import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Members',
      home: GroupMembersPage(),
    );
  }
}

class GroupMembersPage extends StatelessWidget {
  final List<Member> members = [
    Member(
        name: 'Moreno Kristovan',
        studentId: '32210013',
        birthdate: '2003-03-10'),
    Member(
        name: 'Nathael Helsa', studentId: '32210105', birthdate: '2003-12-05'),
    Member(
        name: 'Felix Khosasi', studentId: '32210017', birthdate: '2002-11-10'),
    Member(
        name: 'Metta Apriliani', studentId: '32210098', birthdate: '2003-04-05')
    // Add more group members here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Members'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return ListTile(
            title: Text(member.name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MemberDetailsPage(member: member),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Member {
  final String name;
  final String studentId;
  final String birthdate;

  Member({
    required this.name,
    required this.studentId,
    required this.birthdate,
  });
}

class MemberDetailsPage extends StatelessWidget {
  final Member member;

  MemberDetailsPage({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Name: ${member.name}'),
          ),
          ListTile(
            title: Text('Student ID: ${member.studentId}'),
          ),
          ListTile(
            title: Text('Birthdate: ${member.birthdate}'),
          ),
        ],
      ),
    );
  }
}
