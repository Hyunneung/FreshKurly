package my.mypage.db;

public class OrderInfo {
	private int order_id; // 추가
	private int order_number; // 주문번호
	private int item_id;
	private String member_id;
	private String order_deliver; // 배송 상태
	private String order_date; // 주문 날짜
	private int order_amount; // 주문한 상품 수량
	// item 테이블 조인해서 받아올 데이터들
	private String item_image; // 상품 사진 
	private String item_name; // 상품명
	private int item_price; // 상품 단가
	
	
	// getter, setter
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrder_deliver() {
		return order_deliver;
	}
	public void setOrder_deliver(String order_deliver) {
		this.order_deliver = order_deliver;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
}
