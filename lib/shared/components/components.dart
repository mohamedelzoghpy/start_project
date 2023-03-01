import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstapplication/layout/news_app/cubit/states.dart';
import 'package:firstapplication/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

// ignore: invalid_required_named_param
Widget defaultButton({
  double width= double.infinity,
  Color background = Colors.blue,
  bool isUpperCase =true,
  @required String text= '' ,
  @required var function,
})=> Container(
width: width,
color: background,
child: MaterialButton(onPressed: function,
  child:
    Text(
isUpperCase? text.toUpperCase() : text,
style: const TextStyle(
fontSize: 20.0,
color: Colors.white,

),
),




),
);

Widget defaultTextButton({
  @required  var function,
  @required String? text, required TextStyle style,
})=> TextButton(onPressed: function, child: Text(text!.toUpperCase()),);

Widget defaultformfiled({

@required TextEditingController? controller,
@required TextInputType? type,
  var  onChange,
  var onSubmit,
  @required var validate,
  var ontap,
@required String? label,
@required IconData? prefix,
  bool ispassword =false,
  IconData? suffix,
   var suffixpreesed,
  TextStyle? style,
  Color? colorBorder,



})=>TextFormField(
  style:style ,
  //keyboardAppearance:Brightness.light ,
  onTap: ontap ,
  keyboardType:type ,
controller: controller,
  obscureText: ispassword,
  decoration: InputDecoration(
border:const OutlineInputBorder() ,
labelText: label,
prefixIcon: Icon(prefix,),
  suffixIcon:suffix!=null ? IconButton(
      onPressed:suffixpreesed ,
      icon: Icon(suffix)):null,



),
onFieldSubmitted: onSubmit,
onChanged: onChange,
validator: validate,


);
Widget buildTaskItem (Map model,context)=> Dismissible(
  key: Key(model['id'].toString()),


  child:   Padding(

  padding: const EdgeInsets.all(20.0),

  child: Row(

    mainAxisAlignment: MainAxisAlignment.start,

  children: [

  CircleAvatar(

  radius: 45,

  child: Text(

  '${model['time']}',

  style: const TextStyle(

  fontSize: 20,

  fontWeight:FontWeight.bold,

  ),

  ),



  ),

  const SizedBox(

  width: 20,

  ),

  Expanded(

    child:   Column(



    mainAxisSize: MainAxisSize.min,



    crossAxisAlignment: CrossAxisAlignment.start,



    children: [



    Container(



    child: Text(



      '${model['title']}',



    style: const TextStyle(



    fontSize: 20,



    fontWeight: FontWeight.bold



    ),



    ),



    ),



    Container(



    child: Text(
      '${model['date']}',

    style: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),

    ),
    ),
    ],
    ),

  ),

    IconButton(onPressed: (){



      AppCubit.get(context).UpdateData(id:model['id'] , status: 'done');



    },

      icon:const Icon(Icons.check_box),

      color: Colors.green[500],

    ),

    IconButton(onPressed: (){



      AppCubit.get(context).UpdateData(id: model['id'], status: 'Archive');



    },

      icon:const Icon(Icons.archive_outlined),

      color: Colors.black26,

    ),

  ],

  ),

  ),
  onDismissed: (direction) {

    AppCubit.get(context).DeleteDatabase(id: model['id'],);
  },

);
Widget TasksBuilder ({
  required List<Map>tasks,

})=>ConditionalBuilder(

  condition: tasks.length>0,
  builder: (context) => ListView.separated(
    itemBuilder:(context,index)=>buildTaskItem(tasks[index],context),
    separatorBuilder: (context,index)=>myDiver(),
    itemCount: tasks.length,
  ),
  fallback:(context) => Center(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.library_add,
            size: 100,
            color: Colors.grey,
          ),
          const Text('PLEASE INSERT DATA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],

      ),

    ),
  ),

);
Widget myDiver()=>Container(
  width: double.infinity,
  height: 1,
  color:Colors.grey[300] ,
);

Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20),

    child: Row(

      children: [

        Expanded(

          child: Container(

            width: 120,

            height: 120,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                image: NetworkImage('${article['urlToImage']}'),

                fit: BoxFit.cover,

              ),

            ),

          ),

        ),

        const SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,

              children: [

                Expanded(

                  child: Text('${article['title']}',

                    maxLines: 3,

                    overflow:TextOverflow.ellipsis ,

                    style: Theme.of(context).textTheme.bodyText1,

                  ),

                ),

                Text('${article['publishedAt']}',

                  style: const TextStyle(

                    fontSize: 16,

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),
      ],

    ),

  ),
);
Widget articleBuilder(list,context,{isSearch = false})=>ConditionalBuilder(
  condition:list.length >0,
  builder:(context)=>ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) =>buildArticleItem(list[index],context) ,
    separatorBuilder: (context, index) =>myDiver() ,
    itemCount: list.length,
  ),
  fallback:(context) =>isSearch?Container():const Center(child: CircularProgressIndicator()) ,
);

void navigateTo(context,widget)=>Navigator.push(context,
  MaterialPageRoute(
    builder: (context)=>widget,

  ),

);
void navigateAndFinish(context,widget)=>Navigator.pushReplacement(context,
  MaterialPageRoute(
    builder: (context)=>widget,
  ),

);



