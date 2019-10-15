package SW.qna_contoller;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HitListener implements HttpSessionListener{
		private static int qahitCount=0;
		public static int getHitCount() {
			return qahitCount;
		}
		@Override
		public void sessionCreated(HttpSessionEvent se) {
			qahitCount++;
		}
		@Override
		public void sessionDestroyed(HttpSessionEvent se) {
		}
	}