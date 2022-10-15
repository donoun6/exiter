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

import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("company/company_info")
public class Company_infoController {
	
//	Service Bean
	@Autowired
	CompanyService companyService;
	HttpSession session;
	
	/** 사업자 정보 변경 GET 방식
	 * @param model : form:form태그 안의 path값을 Command에 맞게 지정
	 * @param request : 세션을 통해 cid를 가져와 기존 정보를 가저오는 용도
	 */
	@GetMapping
	public String Company_infoForm(Model model, HttpServletRequest request) {
		model.addAttribute("company", new CompanyCommand()); 
		
		session = request.getSession(false);
//		로그인이 안되어있을시 로그인화면으로 보내기
		if (session == null || session.getAttribute("cid") == null){
			return "redirect:/company/company_login";
		}
		long cid = (long) session.getAttribute("cid");
		
		model.addAttribute("companyInfo", companyService.companyInfo(cid));
		String[] tel = companyService.companyInfo(cid).getComTel().split("-"); //전화번호는 3개로 나뉘어져있어 따로 보내준다.
		for(int i = 0; i < tel.length; i++ ) {
			model.addAttribute("tel"+i, tel[i]);
		}
		
		return "company/company_info";
	}
	
	/**	정보변경 처리 POST 방식
	 * @param company : modelAttribute 의 변수를 지정하기 위해 사용. 정보변경에 필요한 domain만 가져와 Command클래스를 만들어 변수로 지정
	 * @param model : Model 객체를 파라미터로 받아서 데이터를 뷰로 넘길 수 있다.
	 */
	@PostMapping
	public String Company_info(@ModelAttribute("company") CompanyCommand company, Model model) {
		model.addAttribute("company",company);
		
		//form 입력값이 없거나 잘못되었을때 다시 정보변경페이지로
		if(company.getComPasswd() == null || company.getComPasswd().length() == 0 ) {
			String err1 = "비밀번호는 필수입력 정보입니다.";
			model.addAttribute("err1",err1);
			return "company/company_info";
		}if(company.getComTel2() == null || company.getComTel2().length() == 0 || company.getComTel3() == null || company.getComTel3().length() == 0 ) {
			String err2 = "전화번호는 필수입력 정보입니다.";
			model.addAttribute("err2",err2);
			return "company/company_info";
		}if(company.getComAddress1() == null || company.getComAddress1().length() == 0 || company.getComAddress4() == null || company.getComAddress4().length() == 0 ) {
			String err3 = "주소는 필수입력 정보입니다.";
			model.addAttribute("err3",err3);
			return "company/company_info";
		}if(company.getComName() == null || company.getComName().length() == 0 ) {
			String err7 = "점포명은 필수입력 정보입니다.";
			model.addAttribute("err7",err7);
			return "company/company_info";
		}
		
		companyService.updateCompanyInfo(company);
		return "redirect:/company";
	}
}