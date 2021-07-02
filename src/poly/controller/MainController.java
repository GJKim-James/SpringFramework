package poly.controller;

import javax.servlet.http.HttpServletRequest;
import static poly.util.CmmUtil.nvl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	// 로깅을 위한 객체
	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "index") // value 호출하려면 URL 뒤에 'value이름.do'를 입력해준다 ex) localhost:8080/index.do
	public String Index() {

		// 해당 메서드가 호출됨을 로그로 기록
		log.info(this.getClass());

		return "/index"; // 'WebContent/WEB=INF/view/index.jsp'를 나타낸다.
	}

	@RequestMapping(value = "Test")
	public String Test() {

		log.info(this.getClass());

		return "/Test";
	}

	@RequestMapping(value = "table")
	public String table() {

		log.info(this.getClass());

		return "/table";
	}

	@RequestMapping(value = "get")
	public String get(HttpServletRequest request, ModelMap model) throws Exception {
		String name = nvl(request.getParameter("name"));

		model.addAttribute("name", name);
		
		String name2 = nvl(request.getParameter("name2"));

		model.addAttribute("name2", name2);

		return "/get";
	}
	
	@RequestMapping(value = "post")
	public String post() {

		log.info(this.getClass());

		return "/postForm";
	}
	
	@RequestMapping(value = "doPost", method = RequestMethod.POST)
	public String doPost(HttpServletRequest request, ModelMap model) throws Exception {
		String name = nvl(request.getParameter("name"));

		model.addAttribute("name", name);

		return "/get";
	}

}
