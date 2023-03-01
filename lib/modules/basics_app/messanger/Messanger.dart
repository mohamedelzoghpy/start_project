
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar:AppBar(

      backgroundColor: Colors.white,
    elevation: 0.0,
    
    leading: 
     
        Padding(
          padding: const EdgeInsets.all(5.0),

          child: CircleAvatar(
radius: 15.0,

backgroundImage:

NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQGOe8C5kvqBIg/profile-displayphoto-shrink_800_800/0/1645004012823?e=1670457600&v=beta&t=sC0z6nUse69O6JqljngUJ_gAWsIiQqRNjpuR0IckdCA'),


),
        ),

      title:
      Text(

        'Chats',
        style: TextStyle(
           color: Colors.black,

          fontSize: 25,
          fontWeight: FontWeight.bold,


        ),

      ),

      actions: [

        Row(

          children: [

            CircleAvatar(
              backgroundColor: Colors.white,

              radius: 20,
              child:           IconButton(
                onPressed:(){}
                ,
                icon: Icon (Icons.camera_enhance),
                color: Colors.black,
              )

            ),

            SizedBox(

             width: 5,
            ),

            CircleAvatar(
           backgroundColor: Colors.white ,
                radius: 20,
                child:           IconButton(
                  onPressed:(){}
                  ,
                  icon: Icon (Icons.edit),
                  color: Colors.black,
                )

            ),





          ],


        ),


      ],



    


    




      





    ),


      body:
         Padding(


           padding: const EdgeInsets.all(15.0),
           child: Expanded(
             child: SingleChildScrollView(

               child: Column(

                 mainAxisAlignment: MainAxisAlignment.start,

                 children: [

                   Padding(


                     padding: const EdgeInsets.all(5.0),
                     child: Container(
                     padding: EdgeInsets.all(8.0),

                       decoration:

                       BoxDecoration(
                            color: Colors.grey[200],


                     borderRadius: BorderRadius.circular(15.0),

               ),

                       child: Row(

                         children: [

                           Icon(

                             Icons.search,

                           ),
                           SizedBox(

                             width: 5,
                           ),

                           Text(
                             'Search',
                             style:TextStyle(

                               fontWeight: FontWeight.bold,
                               fontSize: 20,


                             ),

                           ),
                           SizedBox(

                             width: 5,
                           ),


                           Row(



                           ),




                         ],





                       ),
                     ),
                   ),


                   SizedBox(

                     height: 20,
                   ),

                Container(

                  height: 110,
                  child: ListView.separated(
                    scrollDirection:Axis.horizontal ,
                  itemBuilder: (context, index)=> buildStoryItem(),

                   separatorBuilder:(context,index)=>SizedBox(
                        width:5,
                      ),
                      itemCount: 20,
                   // shrinkWrap: true,

                  ),
                ),

                   SizedBox(

                     height: 20,
                   ),

                   ListView.separated(

                     itemBuilder: (context, index)=> buildChatItem(),

                     separatorBuilder:(context,index)=>SizedBox(
                       height:20,
                     ),
                     itemCount: 30,
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                   ),










                 ],




               ),
             ),
           ),
         ),

















    );
  }


  Widget buildChatItem()=>Row(
    children: [

      Stack(

        alignment: AlignmentDirectional.bottomEnd,
        children: [

          CircleAvatar(
            radius: 30.0,

            backgroundImage:

            NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQGOe8C5kvqBIg/profile-displayphoto-shrink_800_800/0/1645004012823?e=1670457600&v=beta&t=sC0z6nUse69O6JqljngUJ_gAWsIiQqRNjpuR0IckdCA'),


          ),
          CircleAvatar(
            radius: 9.0,
            backgroundColor: Colors.white,



          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.green,



          ),
          SizedBox(

            height: 20,
          ),

        ],
      ),

      SizedBox(

        width: 5,
      ),




      /*  Text(

                               'mohamed said elzoghpy',

                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,

                               style: TextStyle(

                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,

                               ),

                             ),*/


      Expanded(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Mohamed  Elzoghpy',
              maxLines: 1,
              overflow:TextOverflow.ellipsis ,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(

              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'hello my name is mohmed elzoghy nice to meet u!',

                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ,

                    style: TextStyle(


                      fontSize: 16,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Text(

                  '02:00 pm',
                  style: TextStyle(

                    fontSize: 13,
                    fontWeight: FontWeight.bold,


                  ),



                ),
              ],
            ),




          ],


        ),
      ),


    ],
  );
  Widget buildStoryItem()=>Container(
    width:75.0 ,
    child: Column(



      children: [
        Stack(

          alignment: AlignmentDirectional.bottomEnd,
          children: [

            CircleAvatar(
              radius: 30.0,

              backgroundImage:

              NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQGOe8C5kvqBIg/profile-displayphoto-shrink_800_800/0/1645004012823?e=1670457600&v=beta&t=sC0z6nUse69O6JqljngUJ_gAWsIiQqRNjpuR0IckdCA'),


            ),
            CircleAvatar(
              radius: 9.0,
              backgroundColor: Colors.white,



            ),
            CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,



            ),
            SizedBox(

              height: 20,
            ),

          ],
        ),

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(

            'mohamed said elzoghpy',

            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: TextStyle(

              fontSize: 16,
              fontWeight: FontWeight.bold,

            ),

          ),
        ),
      ],
    ),
  );





}
