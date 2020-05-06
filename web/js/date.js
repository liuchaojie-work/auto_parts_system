function changeTime(time){
    if(time){
        var oDate = new Date(time*1),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth()+1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear +'-'+ getBz(oMonth) +'-'+ getBz(oDay) +' '+ getBz(oHour) +':'+ getBz(oMin) +':'+getBz(oSen);//拼接时间
        return oTime;
    }else{
        return "";
    }

}
//补0
function getBz(num){
    if(parseInt(num) < 10){
        num = '0'+num;
    }
    return num;
}
