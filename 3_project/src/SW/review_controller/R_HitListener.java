package SW.review_controller;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class R_HitListener implements HttpSessionListener{
	private static int ashitCount=0;
	public static int getasHitCount() {
		return ashitCount;
	}
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ashitCount++;
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}
}