
import 'package:alaa_flutter/shared/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
Widget buildTaskItem(Map model,context)=> Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction){
   AppCubit.get(context).deleteData(id: model['id']);
  },
  child: Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            CircleAvatar(
  
              radius: 40.0,
  
              backgroundColor: Colors.pink,
  
              child: Text('${model['time']}', style: const TextStyle(
  
                color: Colors.white,
  
                fontWeight: FontWeight.bold
  
              ),),
  
            ),
  
            const SizedBox(width: 8.0,),
  
            Expanded(
  
              child: Column(
  
                mainAxisSize: MainAxisSize.min,
  
                crossAxisAlignment: CrossAxisAlignment.start,
  
                children: [
  
                  Text('${model['title']}',style: const TextStyle(
  
                    fontWeight: FontWeight.bold,
  
                    fontSize: 22.0
  
                  ),),
  
                  Text('${model['date']}',style: const TextStyle(
  
                    fontSize: 18.0,
  
                    color: Colors.grey,
  
                  ),),
  
                ],
  
              ),
  
              
  
            ),
  
            const SizedBox(width: 8.0,),
  
            IconButton(
  
              color: Colors.green,
  
              onPressed: (){
  
                AppCubit.get(context).updateData(status: 'done', id: model['id'],);
  
              }, 
  
            icon:Icon(
  
              Icons.check_box,
  
              ) ),
  
              IconButton(
  
              color: Colors.black54,
  
              onPressed: (){
  
              AppCubit.get(context).updateData(status: 'archive', id: model['id'],);
  
              }, 
  
            icon:Icon(
  
              Icons.archive_outlined,
  
              ) ),
  
          ],
  
        ),
  
      ),
);

Widget tasksBuilder(
  {
    required List<Map> tasks,
  }
)=> ConditionalBuilder(
          condition: tasks.length>0,
          builder: (context)=> ListView.separated(
              itemBuilder: (context,index)=> buildTaskItem(tasks[index],context),
               separatorBuilder: (context,index)=> Container(
          width: double.infinity,
          height:1.0,
          color:Colors.grey,
               ),
          itemCount: tasks.length
          ),
          fallback: (context)=>const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 70.0,
                ),
                Text('No tasks yet! , please add tasks',style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        );


        Widget buildItem(
          {
            required String  imagePath,
            required String itemName,
           required String  itemShiping,
          required String  itemPrice,
          }
        )=>Row(
                children: [
                  Container(
                      width: 100.0,
                      height: 100.0,
                      //
                      child: Image.network(
                          '$imagePath')),
               SizedBox(width: 20.0,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                     children: [
                       Text('$itemName',style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),),
                                SizedBox(width: 10.0,),
                                Icon(Icons.menu,color: Colors.grey,)
                     ],
                   ),

                            Text('Shiping: $itemShiping \$',style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[600],
                            ),),
                             Row(
                     children: [
                      Icon(Icons.wifi_2_bar_outlined,color: Colors.grey,),
                       Text('Go to website',style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[500],
                                ),),
                                SizedBox(width: 10.0,),
                                
                     ],
                   ),
                   SizedBox(height: 20.0,),
                   Container(
                    width: 100.0,
                    height: 25.0,
                    decoration: BoxDecoration( 
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(textAlign: TextAlign.center,'$itemPrice \$', style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),),
                   ),
                    SizedBox(height: 20.0,),
                  ],
                 ),         
                ],
              );