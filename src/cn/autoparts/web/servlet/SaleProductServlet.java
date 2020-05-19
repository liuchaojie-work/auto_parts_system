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
//        response.setContentType("text/html;charset=utf-8");
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
                pl.setPath("/");
            }
            response.addCookie(pl);
            writeValue(pl.getValue(), response);
        }

    }

    public void removeSale(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
