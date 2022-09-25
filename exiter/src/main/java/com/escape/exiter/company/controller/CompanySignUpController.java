package com.escape.exiter.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.exiter.company.domain.CompanySignUpCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("company/company_signUp")
public class CompanySignUpController {
	
//	Service Bean
	@Autowired
	CompanyService companyService;
	
	
	/**	회원가입 폼 화면 GET 방식
	 * @param model : form:form태그 안의 path값을 Command에 맞게 지정
	 */
	@GetMapping
	public String CompanySignUpForm(Model model) {
		model.addAttribute("company", new CompanySignUpCommand()); 
		return "company/company_signUp";
	}
	
	
	/** 아이디 중복 체크 Ajax/Json
	 * @param comId : jsp에서 id가 comId의 value 값을 ajax finction을 통해 가져온다 
	 * @return 가져온 값을 service의 매개변수에 넣어 값을 되돌려준다.
	 */
	@RequestMapping("checkId")
	@ResponseBody // HTTP(Hyper Text Transfer Protocol)통신을 이용해 비동기 통신을 할때에 body공간에 데이터를 담는다.
	public boolean idCheck(@RequestBody String comId) {
		return companyService.checkUser(comId);
	}
	
	
	/**	회원가입 처리 POST 방식
	 * @param company : modelAttribute 의 변수를 지정하기 위해 사용. 회원가입에 필요한 domain만 가져와 Command클래스를 만들어 변수로 지정
	 * @param model : Model 객체를 파라미터로 받아서 데이터를 뷰로 넘길 수 있다.
	 */
	@PostMapping
	public String CompanySignUp(@ModelAttribute("company") CompanySignUpCommand company, Model model,
			@RequestParam("checkComNum") String checkComNum) {
		model.addAttribute("company",company);
		
		//form 입력값이 없거나 잘못되었을때 다시 회원가입페이지로 / JavaScript에 의존하기보다는 가능하면 Java로 처리
		if(company.getComId() == null || company.getComId().length() == 0 ) {
			String err = "아이디는 필수입력 정보입니다.";
			model.addAttribute("err",err);
			return "company/company_signUp";
		}if(companyService.checkUser(company.getComId())) { //아이디 중복체크 후 페이지 이동 여부 확인
			String err0 = "해당 아이디는 중복된 아이디입니다.";
			model.addAttribute("err0",err0);
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
		}if(companyService.checkComNum(company.getComNum())) { //사업자 등록 번호 중복 조회후 페이지 이동 여부 확인
			String err6 = "중복된 사업자등록번호입니다.";
			model.addAttribute("err6",err6);
			return "company/company_signUp";
		}if(company.getComName() == null || company.getComName().length() == 0 ) {
			String err7 = "점포명은 필수입력 정보입니다.";
			model.addAttribute("err7",err7);
			return "company/company_signUp";
		}
		
		companyService.addUser(company);
		return "company/company_login";
	}

}
