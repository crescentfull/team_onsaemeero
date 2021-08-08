package aaa.controll;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateCast {
	
	
	public int dateCasting(String indate) throws ParseException {
	
		 SimpleDateFormat dateFormat= new SimpleDateFormat( "yyyy-MM-dd" );
		 	Date day1 = new Date();

			
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

		 	String a = sdf.format(day1);
	        Date day2 = null;
	        try{
	            day1 = dateFormat.parse(a);
	            day2 = dateFormat.parse(indate);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        
	        int compare = day1.compareTo( day2 );
	        if( compare < 0 ) // 예약취소가능
		        {   
		            return 1;
		        }
	        else if ( compare > 0 ) //예약취소 불가능
		        {
		            return 0;
		        }
	        else //당일 예약취소 =  불가능
		        {  
		            return 0;
		        }			
	}
	
	public String dateToMonth(String y2) throws ParseException {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //date 폼
		Date birth = sdf.parse(y2); // string이 date로 변경됨
		
		
		sdf = new SimpleDateFormat("MM"); //date를 월만 받아온다.
		String y1 = sdf.format(birth); // birth를 월로 쪼개기
		
		return y1;
	}
	
	public String dateToStr(Date date) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String result = sdf.format(date);
		return result;
	}
	
	public static Date strToDate(String indate) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date result = null;
		
		try {
			result = sdf.parse(indate);
		}catch(Exception e) {
			
		}
		
		return result;
	}
	
	public static Date strToMonth(String indate) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		Date result = null;
		
		try {
			result = sdf.parse(indate);
		}catch(Exception e) {
			
		}
		
		return result;
	}
}
