package net.mem.action;

public class ActionForward {
	private boolean redirect = false; // 포워딩 방식 => true: redirect, false: dispatcher
	private String path = null; // 포워딩 주소
	
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
