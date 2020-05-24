package cn.autoparts.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/saleProduct/*")
public class SaleProductServlet extends BaseServlet {
    public void readySale(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/javascript;charset=utf-8");
        String productInfos = request.getParameter("productInfo");
        Object[] productInfo = productInfos.split(",");
        if(null != productInfo && 0 != productInfo.length){
            Cookie[] cookies = request.getCookies();
            boolean hasCookie = false;
            Cookie pl = null;
            Map<String,Object[]> map;
            for(Cookie c : cookies){
                if("productMap".equals(c.getName())){
                    pl = c;
                    hasCookie = true;
                    break;
                }
            }
            if(hasCookie){
                String pro = URLDecoder.decode(pl.getValue(),"utf-8");
                map = readValueAsMap(pro);
                map.put((String) productInfo[10],productInfo);
                String productMap = writeValueAsString(map);
                String encodeCookie = URLEncoder.encode(productMap, "utf-8");
                pl.setValue(encodeCookie);
            }else{
                map = new LinkedHashMap<String, Object[]>();
                map.put((String) productInfo[10],productInfo);
                String productMap = writeValueAsString(map);
                String encodeCookie = URLEncoder.encode(productMap, "utf-8");
                pl = new Cookie("productMap",encodeCookie);
            }
            response.addCookie(pl);
            writeValue(pl.getValue(), response);
        }

    }

    public void removeSaleByPurNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/javascript;charset=utf-8");
        String purNo = request.getParameter("purNo");
        Cookie[] cookies = request.getCookies();
        Cookie pl = null;
        Map<String, Object[]> map;
        for(Cookie c : cookies){
            if("productMap".equals(c.getName())){
                pl = c;
                String pro = URLDecoder.decode(pl.getValue(),"utf-8");
                map = readValueAsMap(pro);
                map.remove(purNo.trim());
                String productMap = writeValueAsString(map);
                String encodeCookie = URLEncoder.encode(productMap, "utf-8");
                pl.setValue(encodeCookie);
            }
        }
        response.addCookie(pl);
        writeValue(pl.getValue(), response);
    }

    public void removeSaleByPurNos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/javascript;charset=utf-8");
        String purNosStr = request.getParameter("purNos");
        purNosStr = URLDecoder.decode(purNosStr, "utf-8");
        String[] purNos = purNosStr.split(",");
        Cookie[] cookies = request.getCookies();
        Map<String,Object[]> map;
        for(Cookie c : cookies){
            if("productMap".equals(c.getName())){
                Cookie pl = c;
                String pro = URLDecoder.decode(pl.getValue(),"utf-8");
                map = readValueAsMap(pro);
                for(String str : purNos){
                    map.remove(str.trim());
                }
                String productMap = writeValueAsString(map);
                String encodeCookie = URLEncoder.encode(productMap, "utf-8");
                pl.setValue(encodeCookie);
                response.addCookie(pl);
                writeValue(pl.getValue(), response);
            }
        }
    }

}
