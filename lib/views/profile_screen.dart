import 'package:e_commerce/model/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> title = ["Progress Order","Promocodes","Reviews"];
  List<Widget> icon = [
    Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(60)
      ),
      child: const Icon(Icons.shopping_bag)),
      Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(60)
      ),
      child: const Icon(Icons.redeem_outlined),),
      Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(60)
      ),
      child: const Icon(Icons.star)),
    ];

    @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context,listen: false).getUserDetail();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          PopupMenuButton(
            onOpened: (){
              
            },
            icon: const  Icon(Icons.more_vert_outlined
            ,color: Colors.black,
            ),
               itemBuilder: (BuildContext bc) {
            return  [
             const  PopupMenuItem(
                child:Text("Sign Out"),
                // value: '/hello',
              ),
            ];
          }),
          ],
        title: const Text("Profile",
        style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Consumer<CategoryProvider>(
        builder: (context,value,child) {
          final details = value.detail;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipOval(child: Image.asset("assets/images/cloth.png"))),
                  const SizedBox(height: 30,),
                   Text(details["name"] ?? "",style:const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),),
                  const SizedBox(height: 10,),
                  Text(details["username"] ?? ""),
                  const SizedBox(height: 25.5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(3, (index) => 
                    Container(
                      width: height/7,
                      height: height/7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          icon[index],
                          Text(title[index]),
                          Text("5")
                        ],
                      ),
                    )),
                  ),
                  const SizedBox(height: 49,),
                  Padding(
                    padding:  EdgeInsets.only(right: height/4,bottom: 15),
                    child: const Text("Personal Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60
                    ),
                    width: height/2.04,
                    height: height/4.184,
                    child:  Padding(
                      padding: EdgeInsets.only(top: 10.8,right: 12,left: 10,bottom: 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name:"),
                              Text(details["name"] ?? "")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email:"),
                              Text(details["email"] ?? "")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Location:"),
                              Text(details["city"] ?? "")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Zip Code:"),
                              Text(details["zip"] ?? "")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Phone Number:"),
                              Text("+${details["phone"]}")
                              //TODO use provider for the country code then use substring to remove the first zero.
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          );
        }
      ),
    );
  }
}