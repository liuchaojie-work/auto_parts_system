package cn.autoparts.util;

/**
 * 字符串工具类
 * 
 * @author Administrator
 * @date 2020年4月14日下午8:31:54
 * @version V2.0
 */
public class StringUtils {

	private StringUtils() {
	}

	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 */
	public static boolean isEmpty(String str) {
		return null == str || "".equals(str.trim());
	}

}
