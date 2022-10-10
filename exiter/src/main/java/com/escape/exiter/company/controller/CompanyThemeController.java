package com.escape.exiter.company.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.escape.exiter.company.domain.CompanyThemeCommand;
import com.escape.exiter.company.service.CompanyService;
import com.escape.exiter.theme.domain.ThemePrice;
import com.escape.exiter.theme.domain.ThemeReservationTime;
import com.escape.exiter.theme.service.ThemeService;

@Controller
@RequestMapping("/company/company_theme")
public class CompanyThemeController {
	//Service Bean
	@Autowired //나혜누나 서비스 훔쳐오기
	ThemeService themeService;
	
	//Service Bean
	@Autowired
	CompanyService companyService; 
	HttpSession session; // 웹 환경에서 상태를 유지하기 위한 세션
	
	
	/** 테마 등록 폼 화면 GET방식
	 * @param model : form:form태그 안의 path값을 domain에 맞게 지정
	 * @param request : 세션을 가져오기위해
	 * @return
	 */
	@GetMapping
	public String companyThemeForm(Model model, HttpServletRequest request) {
		session = request.getSession(false);
//		로그인이 안되어있을시 로그인화면으로 보내기
		if (session == null || session.getAttribute("cid") == null){
			return "redirect:/company/company_login";
		}
		long cid = (long) session.getAttribute("cid");
		
		model.addAttribute("companyInfo", companyService.themeInfo(cid));
		model.addAttribute("company", new CompanyThemeCommand());
		
		if (request.getParameter("tid") != null) { //get방식으로 tid를 받으면 아래 삭제 서비스가 작동
			Long tid = Long.parseLong(request.getParameter("tid"));
			companyService.deleteThemeReservationTime(tid);
			companyService.deleteThemePrice(tid);
			companyService.deleteTheme(tid);
			return "redirect:/company/company_theme";
		}
		
		return "company/company_theme";
	}
	
	
	/** 인원별 가격 정보 Ajax/Json
	 * @param tid : jsp에서 id가 tid의 value 값을 ajax finction을 통해 가져온다 
	 * @return 가져온 값을 service의 매개변수에 넣어 값을 되돌려준다.
	 */
	@RequestMapping("getPrice")
	@ResponseBody // HTTP(Hyper Text Transfer Protocol)통신을 이용해 비동기 통신을 할때에 body공간에 데이터를 담는다.
	public List<ThemePrice> getPrice(@RequestBody long tid) {
		List<ThemePrice> price = themeService.getThemePriceByTid(tid);
		return price;
	}
	
	
	/** 예약시간 정보 Ajax/Json
	 * @param tid : jsp에서 id가 tid의 value 값을 ajax finction을 통해 가져온다 
	 * @return 가져온 값을 service의 매개변수에 넣어 값을 되돌려준다.
	 */
	@RequestMapping("getReservationTime")
	@ResponseBody // HTTP(Hyper Text Transfer Protocol)통신을 이용해 비동기 통신을 할때에 body공간에 데이터를 담는다.
	public List<ThemeReservationTime> getReservationTime(@RequestBody long tid) {
		List<ThemeReservationTime> reservationTime = themeService.getThemeReservationTimeByTid(tid);
		return reservationTime;
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
		//ajax를사용하지 않아 post방식에도 테마정보를 넣어줘야한다. 시간이나면 ajax로 수정하기
		session = request.getSession(false);
		long cid = (long) session.getAttribute("cid");
		model.addAttribute("companyInfo", companyService.themeInfo(cid)); //테마정보를 뿌려주기 위함
		
		//유효성 검사
		company.setTImage(file.getOriginalFilename());
		String err = "*모든 정보는 필수입력 정보입니다.";
		if(company.getTName() == null || company.getTName().length() == 0 ) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}if(company.getTCategory() == null || company.getTCategory().length() == 0 ) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}if(company.getTLevel() == null) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}if(company.getTTime() == null) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}if(company.getTNum() == null) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}for (int i = 0; i < company.getTNum(); i++) {	//추가될 개수만큼 for문을 돌려
			if(request.getParameter("tPrice"+(i+1)) == null || request.getParameter("tPrice"+(i+1)).length() == 0) {
				model.addAttribute("err",err);
				return "company/company_theme";
			}
		}if(company.getTImage() == null || company.getTImage().length() == 0) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}if(company.getTDef() == null || company.getTDef().length() == 0) {
			model.addAttribute("err",err);
			return "company/company_theme";
		}
		
		//사진 파일 저장
		String PathSpl = request.getSession().getServletContext().getRealPath("/").split(".metadata")[0]; //실제 경로값은 공유가 안되기 때문에 잘라서 저장후 조원들과 공유
		String addPath = "exiter\\src\\main\\webapp\\resources\\images\\theme\\"; //저장될 추가 경로
		String path = PathSpl + addPath; // 최종 저장 경로
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
		
		//테마 추가, 가격 추가, 예약시간 추가
		companyService.addTheme(company); 
		
		for (int i = 0; i < company.getTNum(); i++) {	//추가될 개수만큼 for문을 돌려
			int tPrice = Integer.parseInt(request.getParameter("tPrice"+(i+1))); //int타입으로 캐스팅
			Long tid = companyService.getTid(company.getTName()); //테마의 이름을 가지고 tid 추출
			companyService.addThemePrice(tid, i+1 ,tPrice); //인원별 가격 등록
		}
		
		int j = Integer.parseInt(request.getParameter("trNum"));
		for (int i = 0; i < j; i++) {	//추가될 개수만큼 for문을 돌려
			String trTime = request.getParameter("trTime"+(i+1));
			Long tid = companyService.getTid(company.getTName());
			companyService.addThemeReservationTime(tid, trTime); //예약시간대 등록
		}
		
		return "redirect:/company/company_theme";
	}

}