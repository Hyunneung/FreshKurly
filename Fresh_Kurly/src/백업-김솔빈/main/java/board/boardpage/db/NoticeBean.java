package board.boardpage.db;

public class NoticeBean {
	private int		notice_num;	     //글번호
	private String	notice_name;     //글 작성자
	private String	notice_pass;     //글 비밀번호
	private String	notice_subject;  //글 제목
	private String	notice_content;  //글 내용
	private int		notice_view;//글의 조회수
	private String  notice_date;
	private int cnt;
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_pass() {
		return notice_pass;
	}
	public void setNotice_pass(String notice_pass) {
		this.notice_pass = notice_pass;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_view() {
		return notice_view;
	}
	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	
	
	
	
}
