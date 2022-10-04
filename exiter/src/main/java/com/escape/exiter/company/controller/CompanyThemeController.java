package com.escape.exiter.company.controller;

import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.escape.exiter.company.domain.CompanyThemeCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("/company/company_theme")
public class CompanyThemeController {
	@Autowired
	CompanyService companyService; //Service Bean
	HttpSession session; // 웹 환경에서 상태를 유지하기 위한 세션
	
	
	/** 테마 등록 폼 화면 GET방식
	 * @param model : form:form태그 안의 path값을 domain에 맞게 지정
	 * @param request : 세션을 가져오기위해
	 * @return
	 */
	@GetMapping
	public String companyThemeForm(Model model, HttpServletRequest request) {
		model.addAttribute("company", new CompanyThemeCommand());
		session = request.getSession(false);
		long cid = (long) session.getAttribute("cid");
		companyService.themeInfo(cid);
		model.addAttribute("companyInfo",companyService.themeInfo(cid));
		return "company/company_theme";
}
	
	
	/**
	 * 가져올 파일 최대 데이터 설정
	 * @return
	 */
	@Bean
    public MultipartResolver multipartResolver() {
        org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 1024 * 1024 * 10
        return multipartResolver;
    }
	
	
	/**	테마 등록 처리
	 * @param company : modelAttribute 의 변수를 지정하기 위해 사용. 회원가입에 필요한 domain만 가져와 Command클래스를 만들어 변수로 지정
	 * @param model : Model 객체를 파라미터로 받아서 데이터를 뷰로 넘길 수 있다.
	 * @param file : 파일을 가져와 프로젝트 폴더에 복사
	 * @param request : input에 값을 가져오기위해 사용
	 */
	@PostMapping
	public String companyTheme(@ModelAttribute("company") CompanyThemeCommand company, Model model,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		String PathSpl = request.getSession().getServletContext().getRealPath("/").split(".metadata")[0]; //실제 경로값은 공유가 안되기 때문에 잘라서 저장후 조원들과 공유
		String addPath = "exiter\\src\\main\\webapp\\resources\\images\\theme\\"; //저장될 추가 경로
		String path = PathSpl + addPath; // 최종 저장 경로
		company.setTImage(file.getOriginalFilename());
		try(
				FileOutputStream fos = new FileOutputStream(path + file.getOriginalFilename());
                InputStream is = file.getInputStream();
        ){
        	    int readCount = 0;
        	    byte[] buffer = new byte[1024];
            while((readCount = is.read(buffer)) != -1){
                fos.write(buffer,0,readCount);
            }
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
		
		companyService.addTheme(company);
		
		for (int i = 0; i < company.getTNum(); i++) {	//추가될 갯수만큼 for문을 돌려
			int tPrice = Integer.parseInt(request.getParameter("tPrice"+(i+1))); //int타입으로 캐스팅
			Long tid = companyService.getTid(company.getTName()); //테마의 이름을 가지고 tid 추출
			companyService.addThemePrice(tid, i+1 ,tPrice); //인원별 가격 등록
		}
		
		int j = Integer.parseInt(request.getParameter("trNum"));
		for (int i = 0; i < j; i++) {	//추가될 갯수만큼 for문을 돌려
			String trTime = request.getParameter("trTime"+(i+1));
			Long tid = companyService.getTid(company.getTName());
			companyService.addThemeReservationTime(tid, trTime); //예약시간대 등록
		}
		
		return "redirect:/company/company_theme";
	}
}