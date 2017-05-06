package user.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
/*
 * 时间格式化工具类
 * */
	
	public String formatTime(String m_time) throws ParseException{
		DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");//定义输出格式
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");//定义输入格式
		Date date = inputFormat.parse(m_time);
		String outputText = outputFormat.format(date);
		return outputText;
	}
	
	public String formatTime_s(String m_time) throws ParseException{
		DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义输出格式
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");//定义输入格式
		Date date = inputFormat.parse(m_time);
		String outputText = outputFormat.format(date);
		return outputText;
	}
	
	/*
	 * java获取当前时间并转化为标准形式
	 * */
	public String getTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义输出格式
		return  df.format(new Date());//获取服务器当前时间并格式化
	}
}
