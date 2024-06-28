import 'package:employe_portal/view/create_employee.dart';
import 'package:employe_portal/view/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class aUsers extends StatefulWidget {
  const aUsers({Key? key}) : super(key: key);

  @override
  State<aUsers> createState() => _aUsersState();
}

class _aUsersState extends State<aUsers> {
  late DateTime _selectedDate;
  bool _showAllUsers = true;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Employees",
          style: TextStyle(
              color: Color(0xff2476BD),
              fontSize: 20), // Optional: to change the text color
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Color(0xff2476BD),
                size: 30,
              ), // Change color as needed
              onPressed: () {
                // Define the action when the icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Create_Employee(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('All Employees')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                var documents = snapshot.data!.docs;

                if (_showAllUsers) {
                  return _buildUserList(documents);
                } else {
                  // Filter documents based on the selected date
                  var filteredDocuments = documents.where((document) {
                    return document['date'].toString().substring(0, 10) ==
                        _selectedDate.toIso8601String().substring(0, 10);
                  }).toList();
                  return _buildUserList(filteredDocuments);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(List<QueryDocumentSnapshot> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        var document = documents[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home_Screen(
                  image: document['imageUrl'],
                  contactemail: document['emergencyContact']['email'],
                  name: document['name'],
                  currance: document['currency'],
                  salary: document['salary'],
                  phone: document['phone'],
                  address: document['address'],
                  nationality: document['nationality'],
                  employer: document['employer'],
                  desination: document['designation'],
                  contactname: document['emergencyContact']['name'],
                  contactphone: document['phone'],
                  cotactemail: document['emergencyContact']['email'],
                  viewcontract: document['contractDocumentUrl'],
                  viewofferletter: document['offercontractUrl'],
                  viewdocument: document['otherdoc'],
                  cotactdesination: document['emergencyContact']['designation'],
                ),
              ),
            );
          },
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: (document['imageUrl'] != null &&
                          document['imageUrl']!.isNotEmpty)
                      ? NetworkImage(document['imageUrl'] as String)
                          as ImageProvider<Object>?
                      : const AssetImage("assets/images/man2.png"),
                  radius: 25,
                ),
                title: Text(
                  document['name'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          document['email'],
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                          width: 8), // Adjust the width as needed for the space
                      Text(
                        ' ${document['date']}',
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
              ),
            ],
          ),
        );
      },
    );
  }
}
