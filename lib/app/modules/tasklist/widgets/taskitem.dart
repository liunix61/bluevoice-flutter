/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:39
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-21 21:24:31
 */
import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:bluevoice/app/data/task_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../index.dart';

class TaskItem extends GetView<TasklistController> {
  final Task task;
  TaskItem({
    Key key,
    @required this.task,
  })  : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: _buildRow(context),
    );

    Widget _buildRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Slidable(
          actionPane: SlidableScrollActionPane(),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text('$idstr'),
              foregroundColor: Colors.white,
            ),
            title: Text('$taskname'),
            subtitle: Text('$taskdetail'),
          ),
          actionExtentRatio: 0.20, // 侧滑按钮所占的宽度
          enabled: true, //
          actions: <Widget>[
            IconSlideAction(
              caption: '回放',
              color: Colors.blue,
              icon: Icons.play_arrow,
              onTap: () => Get.offNamed(Paths.Play, arguments: args),
              closeOnTap: false,
            ),
            IconSlideAction(
              caption: '录制',
              color: Colors.indigo,
              icon: Icons.record_voice_over_outlined,
              onTap: () => Get.offNamed(Paths.Recode, arguments: args),
            ),
          ]),
    );
  }
}


