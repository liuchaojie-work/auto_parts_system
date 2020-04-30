<%--
  Created by IntelliJ IDEA.
  User: L1471
  Date: 2020/4/30
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--品牌开始--%>
//批量删除选中的品牌
function deleteByNames() {
var result = confirm("确定删除所选吗？");
if(result){
var checks = $("#brand-selall tr td input[type='checkbox']:checked");
if(0 == checks.length){
alert("未选中任何一条!");
return false;
}
var checkedArr = new Array();
checks.each(function(){
checkedArr.push($(this).val());
});
var names = checkedArr.join(",");
location.href = "${pageContext.request.contextPath}/brand/deleteByNames?names="+names;
}
}

//新增品牌
function addBrand() {
location.href = "${pageContext.request.contextPath}/product-manage.jsp?#addBrand";
}

//查找所有品牌
function findAllBrand(){
location.href = "${pageContext.request.contextPath}/brand/findAll";
}
//修改品牌
function changeBrand(name) {
location.href = "${pageContext.request.contextPath}/brand/change?name="+name;
}
//删除品牌
function deleteBrand(name) {
var result = confirm("确定删除吗？");
if(result){
location.href = "${pageContext.request.contextPath}/brand/deleteByName?name="+name;
}
}
//返回上一级
function goBackBrand() {
var result = confirm("您确定返回吗？");
if(result){
location.href = "${pageContext.request.contextPath}/brand/findAll";
}
}
<%--品牌结束--%>

<%--产品类别开始--%>
//批量删除选中的产品类别
function deleteSomeCategorys() {
var result = confirm("确定删除所选吗？");
if(result){
var checks = $("input[class='checkbox_select']:checked");
if(0 == checks.length){
alert("未选中任何一条!");
return false;
}
var checkedArr = new Array();
checks.each(function(){
checkedArr.push($(this).val());
});
var ccategorys = checkedArr.join(",");
location.href = "${pageContext.request.contextPath}/category/deleteSomeCategorysServlet?ccategorys="+ccategorys;
}
}

//新增类别
function addCategory() {
location.href = "${pageContext.request.contextPath}/addCategory.jsp";
}

//修改类别
function changeCategory(ccategory) {
location.href = "${pageContext.request.contextPath}/category/changeCategoryServlet?ccategory="+ccategory;
}
//删除类别
function deleteCategory(ccategory) {
var result = confirm("确定删除吗？");
if(result){
location.href = "${pageContext.request.contextPath}/category/deleteCategoryByCcategoryServlet?ccategory="+ccategory;
}
}
//返回上一级
function goBackCategory() {
var result = confirm("您确定返回吗？");
if(result){
location.href = "${pageContext.request.contextPath}/category/findAllCategorysServlet";
}
}
<%--产品类别结束--%>