package ex07;

import java.util.ArrayList;
import java.util.List;

// 실행하는 구체적인 함수 내용

public class FoodService {
	
	private ArrayList<FoodDTO> list = new ArrayList<>();
	
	public int add(FoodDTO dto) {
		int row = 0;
		row += list.add(dto) ? 1 : 0;
		return row;
	}
	
	public List<FoodDTO> getList() {
		return list;
	}
	
}
