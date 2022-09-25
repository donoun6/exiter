package com.escape.exiter.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("company/company_login")
public class CompanyLoginController {
	
	@Autowired
	CompanyService companyService;	//Service Bean
	HttpSession session;	// 웹 환경에서 상태를 유지하기 위한 세션
	
	/**	로그인 폼 화면 GET 방식
	 * @param model : form:form태그 안의 path값을 domain에 맞게 지정
	 */
	@GetMapping
	public String CompanyLoginForm(Model model) {
		model.addAttribute("company", new Company());
		return "company/company_login";
	}
	
	
	/** 로그인 처리 POST 방식
	 * @param company : 회원가입에 필요한 domain form:form 태그 modelAttribute를 지정하기 위해 사용
	 * @param model : Model 객체를 파라미터로 받아서 데이터를 뷰로 넘길 수 있다.
	 * @param request : 세션을 가져와 담을 JSP 내장 객체
	 * @return
	 */
	@PostMapping
	public String CompanyLogin(@ModelAttribute("company") Company company, Model model,
			HttpServletRequest request) {
		
		//form 입력값이 없거나 잘못되었을때 다시 회원가입페이지로
		if(company.getComId() == null || company.getComId().length() == 0 ) {
			String err = "아이디를 입력하세요.";
			model.addAttribute("err",err);
			return "company/company_login";
		}if(company.getComPasswd() == null || company.getComPasswd().length() == 0 ) {
			String err0 = "비밀번호를 입력하세요.";
			model.addAttribute("err0",err0);
			return "company/company_login";
		}if(!companyService.login(company.getComId(), company.getComPasswd())) { //로그인 검사 false값이 나오면 로그인화면으로
			String err1 = "아이디 또는 비밀번호를 잘못 입력했습니다.";
			model.addAttribute("err1",err1);
			return "company/company_login";
		}
		
		company = companyService.CompanyInfo(company.getComId()); //사업자 정보를 도메인에 저장
		session = request.getSession(true); //세션 호출
		session.setAttribute("comId", company.getComId()); //세션에 담을 데이터
		session.setAttribute("cid", company.getCid());
		return "company/company";
	}
}
