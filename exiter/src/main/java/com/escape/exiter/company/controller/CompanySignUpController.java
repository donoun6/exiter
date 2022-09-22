package com.escape.exiter.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.escape.exiter.company.domain.CompanyUserCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("company/company_signUp")
public class CompanySignUpController {
	
//	Service Bean
	@Autowired
	CompanyService companyService;
	
	
	/**	회원가입 폼 화면 GET 방식
	 * @param model : form:form 태그 modelAttribute 의 변수를 지정하기 위해 사용
	 */
	@GetMapping
	public String CompanySignUpForm(Model model) {
		model.addAttribute("company", new CompanyUserCommand()); 
		return "company/company_signUp";
	}
	
	
	/**	회원가입 처리 화면 POST 방식
	 * @param company : 회원가입에 필요한 domain만 가져와 Command클래스를 만들어 변수로 지정
	 * @param model : 위와 같은 이유
	 */
	@PostMapping
	public String CompanySignUp(@ModelAttribute("company") CompanyUserCommand company, Model model,
			@RequestParam("checkComNum") String checkComNum) {
		model.addAttribute("company",company);
		
		//form 입력값이 없거나 잘못되었을때 다시 회원가입페이지로 / JavaScript에 의존하기보다는 가능하면 Java로 처리
		if(company.getComId() == null || company.getComId().length() == 0 ) {
			String err = "아이디는 필수입력 정보입니다.";
			model.addAttribute("err",err);
			return "company/company_signUp";
		}if(company.getComPasswd() == null || company.getComPasswd().length() == 0 ) {
			String err1 = "비밀번호는 필수입력 정보입니다.";
			model.addAttribute("err1",err1);
			return "company/company_signUp";
		}if(company.getComTel2() == null || company.getComTel2().length() == 0 || company.getComTel3() == null || company.getComTel3().length() == 0 ) {
			String err2 = "전화번호는 필수입력 정보입니다.";
			model.addAttribute("err2",err2);
			return "company/company_signUp";
		}if(company.getComAddress1() == null || company.getComAddress1().length() == 0 || company.getComAddress4() == null || company.getComAddress4().length() == 0 ) {
			String err3 = "주소는 필수입력 정보입니다.";
			model.addAttribute("err3",err3);
			return "company/company_signUp";
		}if(company.getComNum() == null || company.getComNum().length() == 0 ) {
			String err4 = "사업자등록번호는 필수입력 정보입니다.";
			model.addAttribute("err4",err4);
			return "company/company_signUp";
		}if(!checkComNum.contentEquals("ok")) { //사업자 등록 번호 조회후 페이지 이동 여부 확인
			String err5 = "등록되지 않은 사업자등록번호입니다.";
			model.addAttribute("err5",err5);
			return "company/company_signUp";
		}if(company.getComName() == null || company.getComName().length() == 0 ) {
			String err6 = "점포명은 필수입력 정보입니다.";
			model.addAttribute("err6",err6);
			return "company/company_signUp";
		}
		
		companyService.addUser(company);
		return "company/company_login";
	}
}
