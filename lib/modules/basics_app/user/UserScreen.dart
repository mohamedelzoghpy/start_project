// ignore_for_file: use_key_in_widget_constructors
import 'package:firstapplication/models/user/user_model.dart';
import 'package:flutter/material.dart';



class user_screen  extends StatelessWidget {

  List<DataModel> users = [

     DataModel(
      name: 'Mohamed',
      id: 1,
      phone: '+201020393879',

  ),
     DataModel(
         name: 'mama',
         id: 2,
         phone: '+201009746678,'

     ),
     DataModel(
         name: 'papa',
         id: 3,
         phone: '+201001144364',

     ),
     DataModel(
         name: 'ahmed said',
         id: 4,
         phone: '+201005346968',

     ),
     DataModel(
         name: 'Abdo Said',
         id: 5,
         phone: '+20193379371',

     ),
     DataModel(
         name: 'Mohamed Abdo',
         id: 6,
         phone: '+201025112531',

     ),
     DataModel(
         name: 'Rakaa',
         id: 7,
         phone: '+201011865475',

     ),
     DataModel(
       name: 'Mohamed',
       id: 1,
       phone: '+201020393879',

     ),
     DataModel(
         name: 'mama',
         id: 2,
         phone: '+201009746678,'

     ),
     DataModel(
       name: 'papa',
       id: 3,
       phone: '+201001144364',

     ),
     DataModel(
       name: 'ahmed said',
       id: 4,
       phone: '+201005346968',

     ),
     DataModel(
       name: 'Abdo Said',
       id: 5,
       phone: '+20193379371',

     ),
     DataModel(
       name: 'Mohamed Abdo',
       id: 6,
       phone: '+201025112531',

     ),
     DataModel(
       name: 'Rakaa',
       id: 7,
       phone: '+201011865475',

     ),
     DataModel(
       name: 'Mohamed',
       id: 1,
       phone: '+201020393879',

     ),
     DataModel(
         name: 'mama',
         id: 2,
         phone: '+201009746678,'

     ),
     DataModel(
       name: 'papa',
       id: 3,
       phone: '+201001144364',

     ),
     DataModel(
       name: 'ahmed said',
       id: 4,
       phone: '+201005346968',

     ),
     DataModel(
       name: 'Abdo Said',
       id: 5,
       phone: '+20193379371',

     ),
     DataModel(
       name: 'Mohamed Abdo',
       id: 6,
       phone: '+201025112531',

     ),
     DataModel(
       name: 'Rakaa',
       id: 7,
       phone: '+201011865475',

     ),
     DataModel(
       name: 'Mohamed',
       id: 1,
       phone: '+201020393879',

     ),
     DataModel(
         name: 'mama',
         id: 2,
         phone: '+201009746678,'

     ),
     DataModel(
       name: 'papa',
       id: 3,
       phone: '+201001144364',

     ),
     DataModel(
       name: 'ahmed said',
       id: 4,
       phone: '+201005346968',

     ),
     DataModel(
       name: 'Abdo Said',
       id: 5,
       phone: '+20193379371',

     ),
     DataModel(
       name: 'Mohamed Abdo',
       id: 6,
       phone: '+201025112531',

     ),
     DataModel(
       name: 'Rakaa',
       id: 7,
       phone: '+201011865475',

     ),





   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(


    title: Padding(
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: Text(
       'Users',

   style: TextStyle(

fontSize: 25,
fontWeight: FontWeight.bold,



),
),
    ),
    ),
      body:

        ListView.separated(itemBuilder:(context,  index)=>BuildUserItem(users[index]) ,
            separatorBuilder: (context,  index)=> Padding(
              padding: const EdgeInsetsDirectional.only(start: 20,),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300] ,

              ),
            ) ,
            itemCount:users.length),

//      Row(
//
//
//        children: [
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: CircleAvatar(
//
//
//              radius: 30,
//
//              child: Text(
//                '1',
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 20,
//
//                ),
//              ) ,
//            ),
//          ),
//           Column(
//
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             children: [
//               Text(
//
//                 'Mohamed said',
//
//                 style: TextStyle(
//
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//
//               ),
//               Text(
//
//                 '+201004784648',
//
//                 style: TextStyle(
//                   color: Colors.grey,
//
//                   fontSize: 16,
//                //   fontWeight: FontWeight.bold,
//                 ),
//
//               ),
//
//             ],
//           ),
//        ],
//
//      ),


    );
  }

Widget BuildUserItem(DataModel user)=>Padding(
  padding: const EdgeInsetsDirectional.only(start:10.0),
  child:   Row(




    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(


          radius: 25,

          child: Text(
            '${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,

            ),
          ) ,
        ),
      ),
      Column(

        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(

            '${user.name}',

            style: TextStyle(

              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

          ),
          Text(

            '${user.phone}',

            style: TextStyle(
              color: Colors.grey,

              fontSize: 16,
              //   fontWeight: FontWeight.bold,
            ),

          ),

        ],
      ),
    ],

  ),
);



}
