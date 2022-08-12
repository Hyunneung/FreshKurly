package board.boardpage.db;

public class QnaBean {
	private int		qna_number;	  //글번호
	private String	qna_name;	  //글 작성자
	private String	qna_pass;	  //글 비밀번호
	private String	qna_subject;  //글 제목
	private String	qna_content;  //글 내용
	private int		qna_view;     //글의 조회수
	private String  qna_reg_date; //글의 등록날짜
	private int cnt;
	public int getQna_number() {
		return qna_number;
	}
	public void setQna_number(int qna_number) {
		this.qna_number = qna_number;
	}
	public String getQna_name() {
		return qna_name;
	}
	public void setQna_name(String qna_name) {
		this.qna_name = qna_name;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_view() {
		return qna_view;
	}
	public void setQna_view(int qna_view) {
		this.qna_view = qna_view;
	}
	public String getQna_reg_date() {
		return qna_reg_date;
	}
	public void setQna_reg_date(String qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
}
