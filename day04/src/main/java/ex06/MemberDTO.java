package ex06;

public class MemberDTO {

		private String name;
		private String imgPath;
		
		public MemberDTO() {}
//		* 안쓸걸 만드는 이유
//		usebean을 쓰기 위해서는 매개변수를 받지 않는 빈 기본생성자가 반드시 있어야함
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
			this.imgPath = "image/" + name + ".png";
			
		}
		public String getImgPath() {
			return imgPath;
		}
		public void setImgPath(String imgPath) {
			this.imgPath = imgPath;
		}

		
}
