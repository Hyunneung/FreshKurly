package my.mypage.action;

public class ActionForward {
	private boolean redirect = false; // true: redirect, false: dispatcher
	private String path = null; // 주소
	
	// getter, setter
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean b) {
		this.redirect = b;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
