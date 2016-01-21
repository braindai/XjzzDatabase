﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="XjzzDatabase.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<a href="#" onclick="add_line();">添加一行</a>&nbsp;&nbsp;<a href="#" onclick="remove_line();">删除一行</a>&nbsp;&nbsp;<a href="#" onclick="up_exchange_line();">上移</a>&nbsp;&nbsp;<a href="#" onclick="down_exchange_line();">下移</a>
<table>
<tr><td>序号</td><td>步骤名称</td><td>步骤描述</td><td>相关操作</td></tr>
</table>
<table id="content">
</table>
<script >
var currentStep=0;
var max_line_num=0;
function add_line(){
  max_line_num=$("#content tr:last-child").children("td").html();
  if(max_line_num==null) {
    max_line_num=1;
  }
  else{
    max_line_num=parseInt(max_line_num);
 max_line_num+=1;
  }
  $('#content').append("<tr id='line"+max_line_num+"' onclick='lineclick(this);'><td>"+max_line_num+"</td><td>打开网页"+max_line_num+"</td><td>打开登录网页"+max_line_num+"</td><td>删除&nbsp;&nbsp;编辑</td></tr>");
}
function remove_line(){  
  $("#content tr").each(
    function(){
   var seq=parseInt($(this).children("td").html());
   if(seq==currentStep) $(this).remove();
   if(seq>currentStep) $(this).children("td").each(function(i){if(i==0)$(this).html(seq-1);});
 }
  );
  currentStep=0;
}
function up_exchange_line(){ 
  if(currentStep==0){
    alert('请选择一项!');
 return false;
  }
  if(currentStep<=1){
     alert('非法操作!');
  return false;
  }
  var upStep=currentStep-1;
  //修改序号
  $('#line'+upStep+" td:first-child").html(currentStep);
  $('#line'+currentStep+" td:first-child").html(upStep);
  //取得两行的内容
  var upContent=$('#line'+upStep).html();
  var currentContent=$('#line'+currentStep).html();
  $('#line'+upStep).html(currentContent);
  //交换当前行与上一行内容
  $('#line'+currentStep).html(upContent);  
  $('#content tr').each(function(){$(this).css("background-color","#ffffff");});
  $('#line'+upStep).css("background-color","yellow"); 
  currentStep=upStep;
}
function down_exchange_line(){
 if(currentStep==0){
    alert('请选择一项!');
 return false;
 }
 if(currentStep>=max_line_num){
     alert('非法操作!');
  return false;
  }
  var nextStep=parseInt(currentStep)+1;
  //修改序号
  $('#line'+nextStep+" td:first-child").html(currentStep);
  $('#line'+currentStep+" td:first-child").html(nextStep);
  //取得两行的内容
  var nextContent=$('#line'+nextStep).html();
  var currentContent=$('#line'+currentStep).html();
  $('#line'+nextStep).html(currentContent);
  //交换当前行与上一行内容
  $('#line'+currentStep).html(nextContent);  
  $('#content tr').each(function(){$(this).css("background-color","#ffffff");});
  $('#line'+nextStep).css("background-color","yellow"); 
  currentStep=nextStep;
}
function lineclick(line){
   $('#content tr').each(function(){$(this).css("background-color","#ffffff");});
   var seq=$(line).children("td").html();
   $(line).css("background-color","yellow");
   currentStep=seq;
}
</script>


</asp:Content>
