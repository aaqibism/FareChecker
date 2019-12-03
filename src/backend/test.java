package backend;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class test {
	public static void main (String[] args)
	{
		Document doc;
		try {
			//doc = Jsoup.connect("https://ride.guru/estimate/3771%20Mcclintock%20Ave,%20Los%20Angeles,%20California%2090089,%20United%20States/Los%20Angeles%20International%20Airport%20(LAX),%201%20World%20Way,%20Los%20Angeles,%20California%2090045,%20United%20States#fare-comparison").get();
			doc = Jsoup.connect("http://303.itpwebdev.com/~aaqibism/student_page.html").get();
			Element body = doc.body();
			System.out.println(doc.getElementsByTag("h1"));
			//Elements h4 = body.select("h4[class='fare']");
			//System.out.println(h4);
			//System.out.println(body.getElementsByClass("shrink"));
			
			//System.out.println(body.getElementById("title"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
