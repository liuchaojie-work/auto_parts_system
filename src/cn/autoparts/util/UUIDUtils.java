package cn.autoparts.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UUIDUtils {
    private UUIDUtils(){ };

    public static String getID(String preStr){
        if(StringUtils.isEmpty(preStr)){
            System.err.println("该id缺少前缀！");
            return null;
        }
        return preStr + getID();
    }

    public static String getID(){
        //获取UUID
        String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
        //生成后缀
        long suffix = Math.abs(uuid.hashCode() % 100000000);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String time = sdf.format(new Date(System.currentTimeMillis()));
        //生成前缀
        long prefix = Long.parseLong(time) * 100000000;
        return String.valueOf(prefix + suffix);
    }

}
